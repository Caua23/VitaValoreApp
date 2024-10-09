import 'package:flutter/material.dart';

class Item {
  final String time;
  final String nome;
  final Color color;
  Item({required this.time, required this.nome, required this.color});

  String toString() {
    return 'time: $time, nome: $nome, color: $color';
  }
}
