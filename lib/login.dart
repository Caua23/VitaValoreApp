import 'package:flutter/material.dart';
import 'package:vita_valore/cadastro.dart';


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
            const Text(
              "Informe seus dados",
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255)
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: "E-mail",
                border: OutlineInputBorder(),
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: "Senha",
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CadastroPage(),
                  ),
                );
              },
              child: const Text("Não tem uma conta?"),
            ),
            ElevatedButton(
              onPressed: (){
                
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}