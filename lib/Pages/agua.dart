import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vita_valore/Widget/agua_diaria.dart';
import 'package:vita_valore/Widget/arc_progress.dart';
import 'dart:math' as math;

import 'package:vita_valore/models/agua_models.dart';

class AguaPage extends StatefulWidget {
  const AguaPage({super.key});

  @override
  State<AguaPage> createState() => _AguaPageState();
}

class _AguaPageState extends State<AguaPage>
    with SingleTickerProviderStateMixin {
  int valueWaterMl = 0;
  late AnimationController _controller;
  double progress = 0.0;
  final double maxProgress = math.pi;

  List<AguaModels> times = [];
  List<bool> clickedIcons = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  void increaseProgress(int index) {
    if (!clickedIcons[index]) {
      setState(() {
        clickedIcons[index] = true;
        progress += maxProgress * 0.25;
        if (progress > maxProgress) {
          progress = maxProgress;
        }
      });

      // Inicia a animação do progresso
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildHeader(),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                double currentProgress = progress * _controller.value;
                return ArcProgress(progress: currentProgress);
              },
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.only(left: 48, top: 40),
              alignment: Alignment.center,
              width: 300,
              child: Center(
                child: Row(
                  children: [
                    const Text("0ml", style: TextStyle(color: Colors.white)),
                    const Spacer(),
                    Text(
                      "$valueWaterMl ml",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            // Expanded(
            //   child: AguaDiaria(
            //     aguaList: times,
            //   ),
            // ),
            _buildWaterIntakeBox(),
            const Spacer(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 119, 0, 255),
        shape: const CircleBorder(),
        onPressed: () {
          incrementoAgua(context);
        },
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  void incrementoAgua(BuildContext context) {
    final TextEditingController waterTemp = TextEditingController();
    String? selectedValue = '200ml';

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: const Color.fromARGB(255, 132, 0, 255),
              title: const Text(
                'Adicione mais água à sua meta diária',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Qual horário?',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 100,
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: waterTemp,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        labelText: '00:00',
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Quantos ml deseja adicionar?',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  DropdownButton<String>(
                    style: const TextStyle(color: Colors.white),
                    dropdownColor: const Color.fromARGB(255, 0, 0, 0),
                    borderRadius: BorderRadius.circular(5),
                    value: selectedValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue!;
                      });
                    },
                    items: <String>['200ml', '500ml', '750ml', '1000ml']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 115,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 255, 255, 255),
                          ),
                          onPressed: () {
                            waterTemp.clear();
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'Cancelar',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 115,
                        child: ElevatedButton(
                          style: TextButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 255, 255, 255),
                          ),
                          onPressed: () {
                            String addedMl =
                                selectedValue!.replaceAll('ml', '').trim();
                            valueWaterMl += int.parse(addedMl);
                            String addedTime = waterTemp.text;

                            if (addedTime.isEmpty) {
                              return; // Não adicione se o tempo estiver vazio
                            }

                            setState(() {
                              times.add(
                                  AguaModels(time: addedTime, ml: addedMl));
                              clickedIcons.add(false);
                            });

                            // Debug para verificar se os itens estão sendo adicionados
                            if (kDebugMode) {
                              print(times.toString());
                              print(times.length);
                              print(valueWaterMl);
                            }

                            waterTemp.clear();
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'Adicionar',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildHeader() {
    return Stack(
      children: [
        const Spacer(),
        Transform.translate(
          offset: const Offset(90, -20),
          child: Image.asset(
            'assets/Ze_gotinha_da_agua.png',
            height: 125,
          ),
        ),
      ],
    );
  }

  Widget _buildWaterIntakeBox() {
    return Transform.translate(
      offset: const Offset(0, 20),
      child: Container(
        width: 300,
        height: 237,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 6, 0, 12),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: const Color.fromRGBO(132, 0, 255, 1).withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 0,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: AguaDiaria(
                aguaList: times,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
