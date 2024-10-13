import 'package:flutter/material.dart';

class ConfiguracaoPage extends StatefulWidget {
  const ConfiguracaoPage({super.key});

  @override
  State<ConfiguracaoPage> createState() => _ConfiguracaoPageState();
}

class _ConfiguracaoPageState extends State<ConfiguracaoPage> {
  bool toque = true;
  final TextEditingController enderecoController = TextEditingController();

  void _saveData() {
    String endereco = enderecoController.text;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Dados Salvos'),
          content: Text(
              'Endereço: $endereco\nNotificações: ${toque ? 'Ativadas' : 'Desativadas'}'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded,
              color: Color(0xFF8400FF)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color(0xFF000000),
        centerTitle: true,
        title: const Text(
          'Configurações',
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
            Row(
              children: [
                const Icon(Icons.home, color: Colors.white),
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
                      controller: enderecoController,
                      decoration: InputDecoration(
                        fillColor: Colors.black,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        labelText: 'Endereço',
                        labelStyle: const TextStyle(
                          color: Color(0xFF979797),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    SizedBox(width: 18),
                    Icon(
                      Icons.notifications_active_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Notificações',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
                Switch(
                  value: toque,
                  onChanged: (value) {
                    setState(() {
                      toque = value;
                    });
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(value ? 'Ativado' : 'Desativado'),
                          content: Text(
                              'O toque de alerta foi ${value ? 'ativado' : 'desativado'}.'),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  activeColor: const Color(0xFF8400FF),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveData,
        backgroundColor: const Color(0xFF8400FF),
        child: const Icon(
          Icons.check,
          color: Colors.white,
        ),
        shape: const CircleBorder(),
      ),
    );
  }
}
