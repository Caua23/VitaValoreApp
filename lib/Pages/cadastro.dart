import 'package:email_validator/email_validator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vita_valore/Pages/login.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:vita_valore/models/users.dart';
import 'package:vita_valore/principal.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passVerificationController =
      TextEditingController();
  var responseMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Spacer(),
            const Row(
              children: [
                SizedBox(
                  height: 30,
                  width: 325,
                  child: Text(
                    "Preencha os campos a seguir",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'assets/fonts/Monserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              responseMessage,
              style: const TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 255, 0, 0),
              ),
            ),
            const Spacer(),
            _buildTextField(nameController, "Nome"),
            const Spacer(),
            _buildTextField(emailController, "E-mail",
                keyboardType: TextInputType.emailAddress),
            const Spacer(),
            _buildTextField(passwordController, "Senha", obscureText: true),
            const Spacer(),
            _buildTextField(passVerificationController, "Repetir senha",
                obscureText: true),
            const Spacer(),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.black)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
              child: const Text(
                "Já tem uma conta?",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
              ),
            ),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Color.fromARGB(255, 132, 0, 255)),
                padding: MaterialStatePropertyAll(
                  EdgeInsets.only(left: 70, right: 70, bottom: 20, top: 20),
                ),
              ),
              onPressed: _registerUser,
              child: const Text(
                "Cadastrar-se",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'assets/fonts/Monserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      {bool obscureText = false, TextInputType? keyboardType}) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 132, 0, 255),
                offset: Offset(-2.5, 2),
              ),
            ],
          ),
          child: SizedBox(
            height: 50,
            width: 325,
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              keyboardType: keyboardType,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                fillColor: Colors.black,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                labelText: label,
                labelStyle:
                    const TextStyle(color: Color.fromARGB(255, 151, 151, 151)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _registerUser() {
    String password = passwordController.text;
    String passwordVer = passVerificationController.text;
    String name = nameController.text;
    String email = emailController.text;

    if (password != passwordVer) {
      return _showErrorMessage("As senhas não são iguais");
    }
    if (password.isEmpty ||
        passwordVer.isEmpty ||
        name.isEmpty ||
        email.isEmpty) {
      return _showErrorMessage("Existem campos vazios, verifique");
    }
    if (!EmailValidator.validate(email)) {
      return _showErrorMessage("E-mail inválido");
    }

    sendData(name, email, password);
  }

  void _showErrorMessage(String message) {
    setState(() {
      responseMessage = message;
    });
  }

  Future<void> sendData(String name, String email, String password) async {
    try {
      var url = Uri.http(dotenv.env['API_URL']!.trim(), '/auth/user/register');
      final newUser = User(name: name, email: email, password: password);

      if (kDebugMode) {
        print(jsonEncode(newUser.toJson()));
      }

      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(newUser.toJson()),
      );

      if (kDebugMode) {
        print("Resposta do servidor: ${response.statusCode} - ");
      }

      if (response.statusCode == 409) {
        return _showSnackBar(
            "Email já está cadastrado no sistema", Colors.redAccent);
      }

      if (response.statusCode == 200) {
        var data = response.body;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', data);
        String? token = prefs.getString('token');
        if (kDebugMode) {
          print("\n Esse é p token no servidor: \n$token");
        }
        responseMessage = data.toString();
        nameController.clear();
        emailController.clear();
        passwordController.clear();
        passVerificationController.clear();

        _showSnackBar("Cadastro realizado com sucesso!", Colors.green);

        await Future.delayed(const Duration(seconds: 2));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Principal(),
          ),
        );
      } else {
        _showErrorMessage("Erro: ${response.body}");
      }
    } catch (e) {
      _showErrorMessage("Erro na requisição: $e");
    }
  }

  void _showSnackBar(String message, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
