import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vita_valore/Pages/cadastro.dart';
import 'package:vita_valore/models/dto/send_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:vita_valore/principal.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String responseMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              responseMessage,
              style: const TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 255, 0, 0),
              ),
            ),
            const Spacer(),
            const Text(
              "Informe seus dados",
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontFamily: 'assets/fonts/Monserrat',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            _buildTextField(emailController, "Email", false),
            const Spacer(),
            _buildTextField(passwordController, "Password", true),
            const Spacer(),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor:
                    WidgetStatePropertyAll(Color.fromARGB(255, 0, 0, 0)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CadastroPage(),
                  ),
                );
              },
              child: const Text(
                "Não tem uma conta?",
                style: TextStyle(
                  color: Color.fromARGB(255, 132, 0, 255),
                  fontWeight: FontWeight.w600,
                  fontFamily: 'assets/fonts/Monserrat',
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor:
                    WidgetStatePropertyAll(Color.fromARGB(255, 132, 0, 255)),
                padding: WidgetStatePropertyAll(
                  EdgeInsets.all(20),
                ),
              ),
              onPressed: () {
                _handleLogin();
              },
              child: const Text(
                "Login",
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

  Widget _buildTextField(
      TextEditingController controller, String label, bool obscure) {
    return Container(
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
          obscureText: obscure,
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
    );
  }

  void _handleLogin() {
    String email = emailController.text.trim();
    String password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        responseMessage = "Existem campos vazios. Verifique.";
      });
      return;
    }

    if (!EmailValidator.validate(email)) {
      setState(() {
        responseMessage = "E-mail inválido.";
      });
      return;
    }

    sendData(email, password);
  }

  Future<void> sendData(String email, String password) async {
    try {
      final newLogin = Login(password: password, email: email);
      var url = Uri.http(dotenv.env['API_URL']!.trim(), '/auth/user/login');
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(newLogin.toJson()),
      );

      if (response.statusCode == 200) {
        var data = response.body;

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', data);

        _showSnackBar("Login efetuado com sucesso", Colors.green);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Principal()),
        );
      } else {
        _handleErrorResponse(response);
      }
    } catch (e) {
      _showSnackBar("Erro: ${e.toString()}", Colors.redAccent);
    }
  }

  void _handleErrorResponse(http.Response response) {
    String errorMessage = "Erro ao autenticar";

    try {
      var errorData = jsonDecode(response.body);
      if (errorData['message'] != null) {
        errorMessage = errorData['message'];
      }
    } catch (e) {
      return;
    }

    if (response.statusCode == 401) {
      _showSnackBar(
          "Verifique os dados informados: $errorMessage", Colors.redAccent);
    } else {
      _showSnackBar("Erro: $errorMessage", Colors.redAccent);
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
