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
                          color: const Color.fromRGBO(132, 0, 255, 1).withOpacity(1),
                          spreadRadius: 3,
                          blurRadius: 0,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0), // ajuste o valor para o raio desejado
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
                          color: const Color.fromRGBO(132, 0, 255, 1).withOpacity(1),
                          spreadRadius: 3,
                          blurRadius: 0,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        '../assets/melhores_precos.png',
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
                          color: const Color.fromRGBO(132, 0, 255, 1).withOpacity(1),
                          spreadRadius: 3,
                          blurRadius: 0,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        '../assets/procurar.png',
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
                          color: const Color.fromRGBO(132, 0, 255, 1).withOpacity(1),
                          spreadRadius: 3,
                          blurRadius: 0,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        '../assets/promocoes.png',
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
                          color: const Color.fromRGBO(132, 0, 255, 1).withOpacity(1),
                          spreadRadius: 3,
                          blurRadius: 0,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        '../assets/seus_pedidos.png',
                      ),
                    ),
                  ),
                ]
              ),
            ),

            const SizedBox(
              height: 40,
            ),

            Container(
                width: 340,
                height: 450,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(255, 41, 39, 42),
                ),
                child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Column( 
                        children: [ 
                          const Text(
                            'Suplementos',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'assets/fonts/GlacialIndifference',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ClipRRect(
                            child: SizedBox(
                              height: 105,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 55,
                                          width: 55,
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(255, 41, 39, 42),
                                            borderRadius: BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                color: const Color.fromRGBO(132, 0, 255, 1).withOpacity(1),
                                                spreadRadius: 3,
                                                blurRadius: 0,
                                                offset: const Offset(0, 0),
                                              ),
                                            ],
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(15.0),
                                            child: Image.asset(
                                              '../assets/blk_100_beef.png',
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          'Blk 100% Beef\nProtein Isolate...',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'assets/fonts/GlacialIndifference',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 8,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        const Text(
                                          'RS 299,99',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'assets/fonts/GlacialIndifference',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ]
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 55,
                                          width: 55,
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(255, 41, 39, 42),
                                            borderRadius: BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                color: const Color.fromRGBO(132, 0, 255, 1).withOpacity(1),
                                                spreadRadius: 3,
                                                blurRadius: 0,
                                                offset: const Offset(0, 0),
                                              ),
                                            ],
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(15.0),
                                            child: Image.asset(
                                              '../assets/Creatina_300g.png',
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          'Creatina 300 g \n- Max Titanium...',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'assets/fonts/GlacialIndifference',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 8,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        const Text(
                                          'RS 110,90',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'assets/fonts/GlacialIndifference',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ]
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 55,
                                          width: 55,
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(255, 41, 39, 42),
                                            borderRadius: BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                color: const Color.fromRGBO(132, 0, 255, 1).withOpacity(1),
                                                spreadRadius: 3,
                                                blurRadius: 0,
                                                offset: const Offset(0, 0),
                                              ),
                                            ],
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(15.0),
                                            child: Image.asset(
                                              '../assets/Chocowheyfer.png',
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          'Chocowheyfer Mu \nChocolate Caixa 12...',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'assets/fonts/GlacialIndifference',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 8,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        const Text(
                                          'RS 83,88',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'assets/fonts/GlacialIndifference',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ]
                                    ),
                                  ),
                                  
                                  const Icon(Icons.arrow_forward, size: 20)
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 1,
                            width: double.infinity,
                            color: const Color.fromARGB(255, 255, 255, 255)
                          ),
                        ]
                      )
                    ),
                    Container(
                      child: Column( 
                        children: [ 
                          const Text(
                            'Petiscos fitness',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'assets/fonts/GlacialIndifference',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ClipRRect(
                            child: SizedBox(
                              height: 105,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 55,
                                          width: 55,
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(255, 41, 39, 42),
                                            borderRadius: BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                color: const Color.fromRGBO(132, 0, 255, 1).withOpacity(1),
                                                spreadRadius: 3,
                                                blurRadius: 0,
                                                offset: const Offset(0, 0),
                                              ),
                                            ],
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(15.0),
                                            child: Image.asset(
                                              '../assets/Salgadinho_Mae_Terra.png',
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          'Salgadinho Mãe Terra\n Zooreta Cebola 45g...',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'assets/fonts/GlacialIndifference',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 8,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        const Text(
                                          'RS 7,49',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'assets/fonts/GlacialIndifference',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ]
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 55,
                                          width: 55,
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(255, 41, 39, 42),
                                            borderRadius: BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                color: const Color.fromRGBO(132, 0, 255, 1).withOpacity(1),
                                                spreadRadius: 3,
                                                blurRadius: 0,
                                                offset: const Offset(0, 0),
                                              ),
                                            ],
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(15.0),
                                            child: Image.asset(
                                              '../assets/Protein_Cookie_Bar.png',
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          'Protein Cookie Bar \nCastanha Caju e C...',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'assets/fonts/GlacialIndifference',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 8,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        const Text(
                                          'RS 6,90',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'assets/fonts/GlacialIndifference',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ]
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 55,
                                          width: 55,
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(255, 41, 39, 42),
                                            borderRadius: BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                color: const Color.fromRGBO(132, 0, 255, 1).withOpacity(1),
                                                spreadRadius: 3,
                                                blurRadius: 0,
                                                offset: const Offset(0, 0),
                                              ),
                                            ],
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(15.0),
                                            child: Image.asset(
                                              '../assets/brownie_low_carb.png',
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          'Brownie Low Carb \nMistura para Brow...',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'assets/fonts/GlacialIndifference',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 8,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        const Text(
                                          'RS 41,58',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'assets/fonts/GlacialIndifference',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ]
                                    ),
                                  ),
                                  
                                  const Icon(Icons.arrow_forward, size: 20)
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 1,
                            width: double.infinity,
                            color: const Color.fromARGB(255, 255, 255, 255)
                          ),
                        ]
                      )
                    ),
                    Container(
                      child: Column( 
                        children: [ 
                          const Text(
                            'Zero Lactose',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'assets/fonts/GlacialIndifference',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ClipRRect(
                            child: SizedBox(
                              height: 105,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 55,
                                          width: 55,
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(255, 41, 39, 42),
                                            borderRadius: BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                color: const Color.fromRGBO(132, 0, 255, 1).withOpacity(1),
                                                spreadRadius: 3,
                                                blurRadius: 0,
                                                offset: const Offset(0, 0),
                                              ),
                                            ],
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(15.0),
                                            child: Image.asset(
                                              '../assets/Mass_Titanium.png',
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          'Mass Titanium 17500\n ZERO LACTOSE 2,4...',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'assets/fonts/GlacialIndifference',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 8,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        const Text(
                                          'RS 110,00',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'assets/fonts/GlacialIndifference',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ]
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 55,
                                          width: 55,
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(255, 41, 39, 42),
                                            borderRadius: BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                color: const Color.fromRGBO(132, 0, 255, 1).withOpacity(1),
                                                spreadRadius: 3,
                                                blurRadius: 0,
                                                offset: const Offset(0, 0),
                                              ),
                                            ],
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(15.0),
                                            child: Image.asset(
                                              '../assets/Zero_Lactose_Whey.png',
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          'Creatina 300 g \n- Max Titanium...',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'assets/fonts/GlacialIndifference',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 8,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        const Text(
                                          'RS 4,99',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'assets/fonts/GlacialIndifference',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ]
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 55,
                                          width: 55,
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(255, 41, 39, 42),
                                            borderRadius: BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                color: const Color.fromRGBO(132, 0, 255, 1).withOpacity(1),
                                                spreadRadius: 3,
                                                blurRadius: 0,
                                                offset: const Offset(0, 0),
                                              ),
                                            ],
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(15.0),
                                            child: Image.asset(
                                              '../assets/Chocolate_Linea.png',
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          'Chocolate Linea Ao \nLeite Diet Zero La...',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'assets/fonts/GlacialIndifference',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 8,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        const Text(
                                          'RS 9,99',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'assets/fonts/GlacialIndifference',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ]
                                    ),
                                  ),
                                  
                                  const Icon(Icons.arrow_forward, size: 20)
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ]
                      )
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
