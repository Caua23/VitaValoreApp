import 'package:flutter/material.dart';
import 'package:vita_valore/login.dart';

class CadastroPage extends StatelessWidget {
  const CadastroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Row(
              children: [
                SizedBox(
                  height: 30,
                  width: 325,
                  child: Text(
                    "Preencha os campos a seguir",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                SizedBox(
                  height: 50,
                  width: 325,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Nome",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                SizedBox(
                  height: 50,
                  width: 325,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "E-mail",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                SizedBox(
                  height: 50,
                  width: 325,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Senha",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                SizedBox(
                  height: 50,
                  width: 325,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Repetir senha",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
              child: const Text("Já tem uma conta?"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Cadastrar-se"),
            ),
          ],
        ),
      ),
    );
  }
}
