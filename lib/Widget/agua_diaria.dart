import 'package:flutter/material.dart';
import 'package:vita_valore/models/agua_models.dart';

class AguaDiaria extends StatelessWidget {
  final List<AguaModels> aguaList;
  const AguaDiaria({super.key, required this.aguaList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: aguaList.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: aguaList.map((entry) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  const SizedBox(width: 40),
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
                    onPressed: () {},
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
