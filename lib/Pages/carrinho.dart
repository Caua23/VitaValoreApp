import 'package:flutter/material.dart';
import 'package:vita_valore/Widget/ItensCompra.dart';
import 'package:vita_valore/models/compra_models.dart';

class CarrinhoPage extends StatefulWidget {
  const CarrinhoPage({super.key});

  @override
  State<CarrinhoPage> createState() => _CarrinhoPageState();
}

class _CarrinhoPageState extends State<CarrinhoPage> {
  final List<ItensCompra> listaSuprementos = [
    ItensCompra(
      urlImagem: 'assets/blk_100_beef.png',
      nome: 'blk 100 beef',
      preco: 250.00,
    ),
    ItensCompra(
      urlImagem: 'assets/Creatina_300g.png',
      nome: 'Creatina 300g',
      preco: 140.00,
    ),
    ItensCompra(
      urlImagem: 'assets/brownie_low_carb.png',
      nome: 'brownie low carb',
      preco: 178.90,
    ),
    ItensCompra(
      urlImagem: 'assets/Mass_Titanium.png',
      nome: 'Mass Titanium',
      preco: 225.00,
    ),
  ];

  final List<ItensCompra> listaPetiscos = [
    ItensCompra(
      urlImagem: 'assets/Chocowheyfer.png',
      nome: 'Chocowheyfer\n 100g',
      preco: 2.50,
    ),
    ItensCompra(
      urlImagem: 'assets/Salgadinho_Mae_Terra.png',
      nome: 'Salgadinho Mae Terra',
      preco: 10.00,
    ),
    ItensCompra(
      urlImagem: 'assets/Protein_Cookie_Bar.png',
      nome: 'Barrinha de proteina 100g',
      preco: 5.90,
    ),
    ItensCompra(
      urlImagem: 'assets/Zero_Lactose_Whey.png',
      nome: 'Whey liquido 100g Zero lactose',
      preco: 15.99,
    ),
  ];

  final List<ItensCompra> listaZeroLactose = [
    ItensCompra(
      urlImagem: 'assets/Zero_Lactose_Whey.png',
      nome: 'Whey liquido 100g ',
      preco: 15.99,
    ),
    ItensCompra(
      urlImagem: 'assets/Mass_Titanium.png',
      nome: 'Mass Titanium',
      preco: 225.00,
    ),
    ItensCompra(
      urlImagem: 'assets/Chocowheyfer.png',
      nome: 'Chocowheyfer 100g',
      preco: 2.50,
    ),
    ItensCompra(
      urlImagem: 'assets/Chocolate_Linea.png',
      nome: 'Chocolate Linea ',
      preco: 14.00,
    ),
  ];
/*
    Não esquecer de atualizar isso no futuro
*/
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
                            15.0), // ajuste o valor para o raio desejado
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
                            color: const Color.fromRGBO(132, 0, 255, 1)
                                .withOpacity(1),
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
                            color: const Color.fromRGBO(132, 0, 255, 1)
                                .withOpacity(1),
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
                            color: const Color.fromRGBO(132, 0, 255, 1)
                                .withOpacity(1),
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
                  ]),
            ),
            const SizedBox(height: 40),
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
                    Column(children: [
                      const Text(
                        'Suplementos',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'assets/fonts/Montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ClipRRect(
                        child: SizedBox(
                          height: 105,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              //Começa aq
                              Expanded(
                                child: SingleChildScrollView(
                                  child: WidgetItenscompra(
                                      itenscompra: listaSuprementos),
                                ),
                              ),
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
                          color: const Color.fromARGB(255, 255, 255, 255)),
                    ]),
                    Column(children: [
                      const Text(
                        'Petiscos fitness',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'assets/fonts/Montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ClipRRect(
                        child: SizedBox(
                          height: 105,
                          child: Expanded(
                            child: SingleChildScrollView(
                              child:
                                  WidgetItenscompra(itenscompra: listaPetiscos),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                          height: 1,
                          width: double.infinity,
                          color: const Color.fromARGB(255, 255, 255, 255)),
                    ]),
                    Column(children: [
                      const Text(
                        'Zero Lactose',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'assets/fonts/Montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ClipRRect(
                        child: SizedBox(
                          height: 105,
                          child: Expanded(
                            child: SingleChildScrollView(
                              child: WidgetItenscompra(
                                  itenscompra: listaZeroLactose),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ]),
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
