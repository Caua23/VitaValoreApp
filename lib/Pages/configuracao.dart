import 'package:flutter/material.dart';

class ConfiguracaoPage extends StatelessWidget {
  const ConfiguracaoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text(
          'Configuração',
          style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontFamily: 'assets/fonts/Monserrat',
              fontWeight: FontWeight.w600),
        ),
      ),
      body: const Center(
        child: Text('Configuração'),
      ),
    );
  }
}
