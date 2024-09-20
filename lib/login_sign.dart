import 'package:flutter/material.dart';
import 'package:vita_valore/cadastro.dart';
import 'package:vita_valore/login.dart';

class LoginSing extends StatelessWidget {
  const LoginSing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Stack(children: [
              Transform.translate(
                offset: const Offset(0, 10),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    width: 100,
                    height: 90,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Image.asset(
                      'assets/VitaValoreLogo2.png',
                      width: 150, // Largura da imagem
                      height: 150,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Stack(
                      children: [
                        Transform.translate(
                          offset: const Offset(10, 200),
                          child: Container(
                            width: 110,
                            height: 80,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(132, 0, 255, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ]),
            Stack(
              children: [
                Transform.translate(
                  offset: const Offset(0, 10),
                  child: Container(
                    width: 375,
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),

                    //Sing in
                    //Sing in

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 50),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                                const Color.fromARGB(255, 0, 0, 0)),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CadastroPage(),
                              ),
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 2),
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                fontFamily: 'assets/fonts/GlacialIndifference',
                                color: Color(0xFF8400FF),
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Transform.translate(
                  offset: const Offset(0, 10),
                  child: Container(
                    width: 375,
                    height: 320,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(80.0),
                      ),
                      color: Color.fromRGBO(132, 0, 255, 1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          },

                          //Login
                          //Login
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 2),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontFamily:
                                    'assets/fonts/glacial-indifference-2/GlacialIndifference-Bold.otf',
                                color: Color(0xFF8400FF),
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ), //
                            ),
                          ),
                        ),
                        const SizedBox(height: 200),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
