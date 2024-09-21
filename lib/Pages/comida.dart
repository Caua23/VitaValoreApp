import 'package:flutter/material.dart';

class ComidaPage extends StatefulWidget {
  const ComidaPage({super.key});

  @override
  State<ComidaPage> createState() => _ComidaPageState();
}

class _ComidaPageState extends State<ComidaPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 0, 0),
      body: Center(
        child: Text('comida'),
      ),
    );
  }
}
