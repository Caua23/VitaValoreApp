import 'package:flutter/material.dart';
import 'package:vita_valore/Widget/calendario.dart';
import 'package:vita_valore/models/CalendarioDiario.dart';

class ComidaPage extends StatefulWidget {
  const ComidaPage({super.key});

  @override
  State<ComidaPage> createState() => _ComidaPageState();
}

List<Item> items = [
  Item(time: '06:00', nome: 'Acordar'),
  Item(time: '07:00', nome: 'Trabalhar'),
  Item(time: '09:50', nome: 'Almoçar'),
  Item(time: '14:00', nome: 'Voltar para casa'),
  Item(time: '16:00', nome: 'descançar'),
];
//Aqui instancia uma lista nova, que contém os itens do calendário diario
//logo la embaixo passo os itens e ele cria os itens para o calendário
//Agora so tem que fazer ficar crescente (deixa para o futuro)
//E tbm texto não pode ser muito grande

class _ComidaPageState extends State<ComidaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Center(
        child: Row(
          children: [
            Expanded(
              child: CalendarioWidget(items: items),
            )
          ],
        ),
      ),
    );
  }
}
