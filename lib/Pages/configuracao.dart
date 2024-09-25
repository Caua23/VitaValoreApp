import 'package:flutter/material.dart';

class ConfiguracaoPage extends StatefulWidget {
  const ConfiguracaoPage({super.key});

  @override
  State<ConfiguracaoPage> createState() => _ConfiguracaoPageState();
}

class _ConfiguracaoPageState extends State<ConfiguracaoPage> {
  bool toque = true; // Mantenha o estado do switch aqui

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Color(0xFF8400FF),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color(0xFF000000),
        centerTitle: true,
        title: const Text(
          'Configuração',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontFamily: 'assets/fonts/Monserrat',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _TextFieldIcone(
              icon: Icons.public,
              labelText: 'País',
            ),
            _TextFieldIcone(
              icon: Icons.home,
              labelText: 'Endereço',
            ),
            _notification(),
          ],
        ),
      ),
    );
  }

  Widget _TextFieldIcone({required IconData icon, required String labelText}) {
    return Row(
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFF8400FF),
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              style: const TextStyle(color: Colors.white, fontSize: 18),
              decoration: InputDecoration(
                fillColor: Colors.black,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                labelText: labelText,
                labelStyle: const TextStyle(
                  color: Color(0xFF979797),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _notification() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Row(
          children: [
            SizedBox(width: 18),
            Icon(Icons.notifications_active_outlined, color: Colors.white),
            SizedBox(width: 10),
            Text(
              'Toque',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
        Switch(
          value: toque,
          onChanged: (value) {
            setState(() {
              toque = value; // Atualiza o estado ao mudar
            });
          },
          activeColor: const Color(0xFF8400FF),
        ),
      ],
    );
  }
}
