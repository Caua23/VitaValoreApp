import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vita_valore/Pages/cadastro.dart';
import 'package:vita_valore/models/dto/send_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var responseMessage = "";
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
            const Row(children: [
              SizedBox(width: 30),
              SizedBox(
                height: 30,
                width: 325,
                child: Text(
                  "Informe seus dados",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontFamily: 'assets/fonts/Monserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ]),
            const Spacer(),
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
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    fillColor: Colors.black,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    labelText: "Email",
                    labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 151, 151, 151)),
                  ),
                ),
              ),
            ),
            const Spacer(),
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
                  controller: passwordController,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    fillColor: Colors.black,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    labelText: "Password",
                    labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 151, 151, 151)),
                  ),
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Color.fromARGB(255, 0, 0, 0)),
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
                    MaterialStatePropertyAll(Color.fromARGB(255, 132, 0, 255)),
                padding: MaterialStatePropertyAll(
                  EdgeInsets.only(left: 70, right: 70, bottom: 20, top: 20),
                ),
              ),
              onPressed: () {
                String password = passwordController.text;

                String email = emailController.text;

                if (password == "" || email == "") {
                  return setState(() {
                    responseMessage = "Existe campos vazios Verifique";
                  });
                }
                if (!EmailValidator.validate(email)) {
                  return setState(() {
                    responseMessage = "E-mail inválido";
                  });
                }
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

  Future<void> sendData(email, password) async {
    final newLogin = Login(password: password, email: email);
    final response = await http.post(
      Uri.parse('${dotenv.env['API_URL']}/auth/user/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(newLogin.toJson()),
    );
    if (response.statusCode != 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          content: Text('Erro a autenticar'),
        ),
      );
    }
    if (response.statusCode == 401) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          content: Text('Verifique o e-mail e a senha, algo esta errado'),
        ),
      );
    }

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      responseMessage = data.toString();

      emailController.clear();
      passwordController.clear();
      return data;
    }
  }
}
