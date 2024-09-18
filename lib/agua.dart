//Nome da branch: VitaValoreAgua

import 'package:flutter/material.dart';

class AguaPage extends StatelessWidget {
  const AguaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Hora de beber água!"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Stack(
              children: [
                const Spacer(),
                Transform.translate(
                  offset: const Offset(90, -20),
                  child: Image.asset(
                    'assets/Ze_gotinha_da_agua.png',
                    height: 140,
                  ),
                ),
                Transform.translate(
                  offset: const Offset(-90, -10),
                  child: Image.asset(
                    'assets/VitaValoreLogo.jpeg',
                    height: 60,
                  ),
                ),
                Transform.translate(
                  offset: const Offset(105, 45),
                  child: const Text(
                    "1h26min",
                    style: TextStyle(
                      fontFamily: 'assets/fonts/GlacialIndifference',
                      fontSize: 15,
                      color: Color.fromARGB(255, 132, 0, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(-35, 190),
                  child: const Text(
                    "800ml",
                    style: TextStyle(
                        fontFamily: 'assets/fonts/GlacialIndifference',
                        fontSize: 13,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(145, 190),
                  child: const Text(
                    "1.600ml",
                    style: TextStyle(
                        fontFamily: 'assets/fonts/GlacialIndifference',
                        fontSize: 16,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ],
            ),
            Transform.translate(
              offset: const Offset(0, 20),
              child: Container(
                width: 290, // Largura da caixa
                height: 220, // Altura da caixa
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 6, 0, 12), // Cor de fundo
                  borderRadius:
                      BorderRadius.circular(20), // Bordas arredondadas
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromRGBO(132, 0, 255, 1)
                          .withOpacity(0.5), // Cor da sombra
                      spreadRadius: 5, // Extensão da sombra
                      blurRadius: 0, // Suavidade da sombra
                      offset: const Offset(0, 0), // Posição da sombra
                    ),
                  ],
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 10), // Espaçamento no início

                        Text(
                          "8:00",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 160), 
                        Text(
                          "400ml",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10), 
                      ],
                    ),
                    SizedBox(height: 20), // Espaçamento entre as Rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 10),
                        Text(
                          "12:00",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 160),
                        Text(
                          "400ml",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10), // Espaçamento no início
                      ],
                    ),
                    SizedBox(height: 20), // Espaçamento entre as Rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 10),
                        Text(
                          "16:00",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 160),
                        Text(
                          "400ml",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10), // Espaçamento no início
                      ],
                    ),
                    SizedBox(height: 20), // Espaçamento entre as Rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 10),
                        Text(
                          "20:00",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 160),
                        Text(
                          "400ml",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10), // Espaçamento no início
                      ],
                    ),
                    SizedBox(height: 20), // Espaçamento entre as Rows
                  ],
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(0, 34),
              child: Container(
                width: 400, // Largura da caixa
                height: 40, // Altura da caixa
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(132, 0, 255, 1), // Cor de fundo
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
