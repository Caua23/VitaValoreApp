import 'package:flutter/material.dart';
import 'package:vita_valore/models/agua_models.dart';

class AguaDiaria extends StatelessWidget {
  final List<AguaModels> aguaList;
  final List<bool> iconesClicados; 
  final Function(int) onIconPressed;

  const AguaDiaria({
    super.key,
    required this.aguaList,
    required this.iconesClicados, 
    required this.onIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: aguaList.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 50),
              Text(
                aguaList[index].time,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 40),
              Text(
                '${aguaList[index].ml} ml',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              iconesClicados[index]
                  ? const Icon(Icons.check, color: Colors.green)
                  : IconButton(
                      icon: const Icon(Icons.add_box_outlined),
                      onPressed: () {
                        onIconPressed(index);
                      },
                    ),
              const SizedBox(width: 20),
            ],
          ),
        );
      },
    );
  }
}
