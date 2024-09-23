import 'package:flutter/material.dart';
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
  // ]; // Isso é um teste n tirar

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
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: CalendarioWidget(items: items),
            ),
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
                    _buildHeader(),
                    for (var comida in itemsComidaNome) _buildItem(comida),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: const Color.fromARGB(255, 84, 84, 84),
      height: 40,
      child: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Alimentação',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 10),
            Icon(Icons.add, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(String text) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        color: const Color.fromARGB(255, 166, 166, 166),
        width: 230,
        height: 40,
        child: Center(
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              Text(
                text,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(width: 25),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
