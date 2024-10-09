import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vita_valore/models/users.dart';

class ContaPage extends StatefulWidget {
  const ContaPage({super.key});

  @override
  State<ContaPage> createState() => _ContaPageState();
}

class _ContaPageState extends State<ContaPage> {
  String responseMessage = '';

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController numeroController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded,
              color: Color.fromARGB(255, 153, 0, 255)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        centerTitle: true,
        title: const Text(
          'Editar perfil',
          style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontFamily: 'assets/fonts/Monserrat',
              fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.account_circle_rounded,
              size: 120,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            const SizedBox(height: 30),
            // Campo de Nome
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 132, 0, 255),
                    offset: Offset(0, 2),
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
                    prefixIcon: const Icon(Icons.person, color: Colors.white),
                    prefixIconConstraints: const BoxConstraints(
                      minWidth:
                          50, // Define o espaçamento entre o ícone e o texto
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            // Campo de Email
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 132, 0, 255),
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: SizedBox(
                height: 50,
                width: 325,
                child: TextField(
                  controller: emailController,
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
                    prefixIcon:
                        const Icon(Icons.email_rounded, color: Colors.white),
                    prefixIconConstraints: const BoxConstraints(
                      minWidth:
                          50, // Define o espaçamento entre o ícone e o texto
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            // Campo de Password
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 132, 0, 255),
                    offset: Offset(0, 2),
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
                    prefixIcon: const Icon(Icons.lock, color: Colors.white),
                    prefixIconConstraints: const BoxConstraints(
                      minWidth:
                          50, // Define o espaçamento entre o ícone e o texto
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            // Campo de Número de Celular
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 132, 0, 255),
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: SizedBox(
                height: 50,
                width: 325,
                child: TextField(
                  controller: numeroController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    fillColor: Colors.black,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    labelText: "Número de celular (Opcional)",
                    labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 151, 151, 151)),
                    prefixIcon:
                        const Icon(Icons.call_rounded, color: Colors.white),
                    prefixIconConstraints: const BoxConstraints(
                      minWidth:
                          50, // Define o espaçamento entre o ícone e o texto
                    ),
                  ),
                ),
              ),
            ),
            Text(
              responseMessage,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 119, 0, 255),
          shape: const CircleBorder(),
          onPressed: () {
            String name = nameController.text;
            String email = emailController.text;
            String password = passwordController.text;
            String numero = numeroController.text;
            if (name.isEmpty || email.isEmpty || password.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.redAccent,
                  content: Text("Preencha todos os campos"),
                  duration: Duration(seconds: 2),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }

            sendData(name, email, password, numero);
            responseMessage = "Conta Atualizada com sucesso!";
            return Navigator.pop(context);
          },
          child:
              const Text("Atualizar", style: TextStyle(color: Colors.white))),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Future<dynamic> sendToken(token) async {
    final response = await http.post(
      Uri.parse('${dotenv.env['API_URL']}/auth/user/verification/$token'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({'Bearer': token}),
    );
    if (response.statusCode != 200) {
      return response.statusCode;
    }

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data.id;
    }
  }

  Future<dynamic> sendData(name, email, password, numero) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');
    final id = sendToken(token);
    final newLogin =
        User(name: name, email: email, password: password, phone: numero);
    final response = await http.post(
      Uri.parse('${dotenv.env['API_URL']}/user/update/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(newLogin.toJson()),
    );
    if (kDebugMode) {
      print(response);
    }
    if (response.statusCode != 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text("Ops algo deu errado"),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return response.statusCode;
    }

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      responseMessage = data.toString();

      nameController.clear();
      emailController.clear();
      passwordController.clear();
      numeroController.clear();
      return data;
    }
  }
}
