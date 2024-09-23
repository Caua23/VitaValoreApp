import 'package:flutter/material.dart';

class ContaPage extends StatelessWidget {
  const ContaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        centerTitle: true,
        title: const Text(
          'Conta',
          style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontFamily: 'assets/fonts/Monserrat',
              fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: const Center(
        child: Text('Conta'),
      ),
    );
  }
}
