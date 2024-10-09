import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:vita_valore/Pages/login.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:vita_valore/models/users.dart';

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
            Row(
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
                      controller: nameController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        fillColor: Colors.black,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        labelText: "Nome",
                        labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 151, 151, 151)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
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
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.black,
                        filled: true,
                        labelText: "E-mail",
                        labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 151, 151, 151)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
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
                      obscureText: true,
                      controller: passwordController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.black,
                        filled: true,
                        labelText: "Senha",
                        labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 151, 151, 151)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
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
                      obscureText: true,
                      controller: passVerificationController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.black,
                        filled: true,
                        labelText: "Repetir senha",
                        labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 151, 151, 151)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
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

            // botão cadastro

            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Color.fromARGB(255, 132, 0, 255)),
                padding: MaterialStatePropertyAll(
                  EdgeInsets.only(left: 70, right: 70, bottom: 20, top: 20),
                ),
              ),
              onPressed: () {
                print("Botão de cadastro pressionado");
                String password = passwordController.text;
                String passwordVer = passVerificationController.text;
                String name = nameController.text;
                String email = emailController.text;
                if (password != passwordVer) {
                  return setState(() {
                    responseMessage = "As senhas não são iguais";
                  });
                }
                if (passwordVer == "" ||
                    password == "" ||
                    name == "" ||
                    email == "") {
                  return setState(() {
                    responseMessage = "Existe campos vazios Verifique";
                  });
                }
                if (!EmailValidator.validate(email)) {
                  return setState(() {
                    responseMessage = "E-mail inválido";
                  });
                }
                sendData(name, email, password);
              },
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

  Future<void> sendData(name, email, password) async {
    try {
      final newUser = User(name: name, email: email, password: password);
      final response = await http.post(
        Uri.parse('${dotenv.env['API_URL']}/auth/user/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(newUser.toJson()),
      );
      print("Resposta do servidor: ${response.statusCode} - ${response.body}");
      if (response.statusCode != 200) {
        return setState(() {
          responseMessage = "Erro: ${response.body}";
        });
      }

      if (response.statusCode == 409) {
        setState(() {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text("Email já está cadastrado no sistema"),
              duration: Duration(seconds: 2),
              behavior: SnackBarBehavior.floating,
            ),
          );
        });
      }

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        responseMessage = data.toString();
        nameController.clear();
        emailController.clear();
        passwordController.clear();
        passVerificationController.clear();
      }
    } catch (e) {
      setState(() {
        responseMessage = "Erro na requisição: $e";
      });
    }
  }
}
