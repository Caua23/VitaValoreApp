import 'package:flutter/material.dart';
import 'package:vita_valore/models/compra_models.dart';

class WidgetItenscompra extends StatelessWidget {
  final List<ItensCompra> itenscompra;

  const WidgetItenscompra({super.key, required this.itenscompra});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itenscompra.length,
        itemBuilder: (context, index) {
          final item = itenscompra[index];
          return Container(
            width: 80,
            margin: const EdgeInsets.symmetric(horizontal: 8),
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
                        color:
                            const Color.fromRGBO(132, 0, 255, 1).withOpacity(1),
                        spreadRadius: 3,
                        blurRadius: 0,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      item.urlImagem,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  item.nome,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'assets/fonts/Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 8,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'R\$ ${item.preco.toString()}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'assets/fonts/Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
