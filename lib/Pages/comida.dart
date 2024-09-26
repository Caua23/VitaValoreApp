import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vita_valore/Widget/calendario.dart';
import 'package:vita_valore/models/calendarioDiario.dart';

class ComidaPage extends StatefulWidget {
  const ComidaPage({super.key});

  @override
  State<ComidaPage> createState() => _ComidaPageState();
}

class _ComidaPageState extends State<ComidaPage> {
  final TextEditingController horarioController = TextEditingController();
  final TextEditingController tarefaController = TextEditingController();
  final List<Item> items = [];

  List<Color> vibrantColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.orange,
    Colors.yellow,
    Colors.teal,
    Colors.pink,
  ];

  final List<String> itemsComidaNome = [
    'Café Gold',
    'Lasanha',
    'Hamburguer',
    'Café da tarde',
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
            SizedBox(height: 170.h),
            SizedBox(
              height: 30.h,
              width: 250.w,
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor:
                      WidgetStatePropertyAll(Color.fromARGB(255, 153, 0, 255)),
                ),
                onPressed: () {
                  criarAgenda(context);
                },
                child: const Text(
                  "Adicionar tarefas diarias",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'assets/fonts/Monserrat',
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              width: 270.w,
              height: 280.h,
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
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      color: const Color.fromARGB(255, 84, 84, 84),
      height: 40.h,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 50),
            const Text(
              'Alimentação',
              style: TextStyle(
                fontSize: 20,
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
        width: 230.w,
        height: 40.h,
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

  Color getStrongColor() {
    return vibrantColors[Random().nextInt(vibrantColors.length)];
  }

  void criarAgenda(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 132, 0, 255),
          content: SizedBox(
            height: 240.h,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Adicionar tarefas diarias",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'assets/fonts/Monserrat',
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 3),
                  const Text(
                    "Bote apenas tarefas repetitivas.\n Caso seja uma Exeção, bote no \ncalendario Normal.",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'assets/fonts/Monserrat',
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 50.h,
                    width: 250.w,
                    child: TextField(
                      controller: horarioController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Horário',
                        labelStyle: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 50.h,
                    width: 250.w,
                    child: TextField(
                      controller: tarefaController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Tarefa',
                        labelStyle: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  ElevatedButton(
                      style: const ButtonStyle(),
                      onPressed: () {
                        String horario = horarioController.text;
                        String tarefa = tarefaController.text;

                        setState(() {
                          if (horario.isEmpty || tarefa.isEmpty) {
                            return;
                          }

                          items.add(Item(
                            time: horario,
                            nome: tarefa,
                            color: getStrongColor(),
                          ));
                        });
                        horarioController.clear();
                        tarefaController.clear();
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Adicionar",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'assets/fonts/Monserrat',
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
