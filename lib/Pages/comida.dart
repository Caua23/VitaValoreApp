import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vita_valore/Widget/calendario.dart';
import 'package:vita_valore/models/calendarioDiario.dart';

class ComidaPage extends StatefulWidget {
  const ComidaPage({super.key});

  @override
  State<ComidaPage> createState() => _ComidaPageState();
}

class _ComidaPageState extends State<ComidaPage> {
  // final List<Color> predefinedColors = [
  //   Colors.red,
  //   Colors.green,
  //   Colors.blue,
  //   Colors.yellow,
  //   Colors.orange,
  //   Colors.purple,
  // ]; // Isso é um teste pro futuro n tirar

  final List<Item> items = [
    Item(time: '06:00', nome: 'Acordar', color: Colors.red),
    Item(time: '07:00', nome: 'Trabalhar', color: Colors.green),
    Item(time: '09:50', nome: 'Almoçar', color: Colors.blue),
    Item(time: '14:00', nome: 'Casa', color: Colors.yellow),
    Item(time: '16:00', nome: 'Descansar', color: Colors.orange),
  ];

  final List<String> itemsComidaNome = [
    'Café Gold',
    'Lasanha',
    'Hambuerguer',
    'Cafe da tarde',
    'Sobremesa',
  ];

  @override
  Widget build(BuildContext context) {
    // var screenWidth = MediaQuery.of(context).size.width;
    // var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: CalendarioWidget(items: items),
            ),
            const Spacer(),
            SizedBox(
              height: 30,
              width: 250,
              child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 153, 0, 255)),
                  ),
                  onPressed: () {
                    setState(() {
                      items.add(Item(
                          time: "15:53", nome: "Foda", color: Colors.white));
                    });
                  },
                  child: const Text(
                    "Adicionar tarefas diarias",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'assets/fonts/Monserrat',
                      fontSize: 15,
                    ),
                  )),
            ),
            const SizedBox(height: 10),
            Container(
              width: 270,
              height: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 41, 39, 42),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _header(),
                    for (var comida in itemsComidaNome) _item(comida),
                  ],
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      color: const Color.fromARGB(255, 84, 84, 84),
      height: 40,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 50),
            const Text(
              'Alimentação',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 20),
            IconButton(
              icon: const Icon(Icons.add),
              color: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _item(String text) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        color: const Color.fromARGB(255, 166, 166, 166),
        width: 230,
        height: 40,
        child: Center(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              Text(
                text,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(width: 50),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}