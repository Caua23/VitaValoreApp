import 'package:flutter/material.dart';
import 'package:vita_valore/models/agua_models.dart';

class AguaDiaria extends StatefulWidget {
  final List<AguaModels> aguaList;

  const AguaDiaria({super.key, required this.aguaList});

  @override
  State<AguaDiaria> createState() => _AguaDiariaState();
}

class _AguaDiariaState extends State<AguaDiaria> {
  // Aqui você pode usar widget.aguaList
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.aguaList.map((entry) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(width: 50),
              Text(
                entry.time,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 60),
              Text(
                '${entry.ml} ml',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add_box_outlined),
                onPressed: () {
                  // Ação para adicionar, se necessário
                },
              ),
              const SizedBox(width: 20),
            ],
          ),
        );
      }).toList(),
    );
  }
}
