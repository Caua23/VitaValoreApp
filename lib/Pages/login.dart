import 'package:flutter/material.dart';
import 'package:vita_valore/Pages/cadastro.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
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
                  EdgeInsets.only(left: 70, right: 70, bottom: 20, top: 20),
                ),
              ),
              onPressed: () {},
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
}
