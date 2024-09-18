import 'package:flutter/material.dart';
import 'package:vita_valore/login.dart';
import 'package:vita_valore/main.dart';

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
                      fontWeight: FontWeight.bold,
                      
                    ),
                  ),
                ),
              ],
            ),
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
            ElevatedButton(

              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.black)
              ),


              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
              child: const Text("Já tem uma conta?",style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15),),
            ),
             ElevatedButton(
              onPressed: (){},
              child: const Text("Cadastrar-se", style: TextStyle(fontWeight: FontWeight.w900),),
            ),
          ],
        ),
      ),
    );
  }
}