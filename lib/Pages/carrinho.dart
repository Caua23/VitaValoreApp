import 'package:flutter/material.dart';

class CarrinhoPage extends StatefulWidget {
  const CarrinhoPage({super.key});

  @override
  State<CarrinhoPage> createState() => _CarrinhoPageState();
}

class _CarrinhoPageState extends State<CarrinhoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 41, 39, 42),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 132, 0, 255),
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 41, 39, 42),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromRGBO(132, 0, 255, 1)
                                .withOpacity(1),
                            spreadRadius: 3,
                            blurRadius: 0,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            25.0), // ajuste o valor para o raio desejado
                        child: Image.asset(
                          '../assets/mais_vendidos.png',
                        ),
                      ),
                    ),
                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 41, 39, 42),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromRGBO(132, 0, 255, 1)
                                .withOpacity(1),
                            spreadRadius: 3,
                            blurRadius: 0,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 41, 39, 42),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromRGBO(132, 0, 255, 1)
                                .withOpacity(1),
                            spreadRadius: 3,
                            blurRadius: 0,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 41, 39, 42),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromRGBO(132, 0, 255, 1)
                                .withOpacity(1),
                            spreadRadius: 3,
                            blurRadius: 0,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 41, 39, 42),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromRGBO(132, 0, 255, 1)
                                .withOpacity(1),
                            spreadRadius: 3,
                            blurRadius: 0,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
