import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vita_valore/models/users.dart';

class ContaPage extends StatefulWidget {
  const ContaPage({super.key});

  @override
  State<ContaPage> createState() => _ContaPageState();
}

class _ContaPageState extends State<ContaPage> {
  String paisSelecionado = 'Selecione um País';
  String dddSelecionado = '';
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  final Map<String, String> dddMap = {
    'África do Sul': '27',
    'Alemanha': '49',
    'Argentina': '54',
    'Austrália': '61',
    'Bélgica': '32',
    'Brasil': '55',
    'Bulgária': '359',
    'Canadá': '1',
    'Chile': '56',
    'China': '86',
    'Colômbia': '57',
    'Dinamarca': '45',
    'Egito': '20',
    'Espanha': '34',
    'Estados Unidos': '1',
    'Filipinas': '63',
    'França': '33',
    'Grécia': '30',
    'Holanda': '31',
    'Índia': '91',
    'Irlanda': '353',
    'Israel': '972',
    'Itália': '39',
    'Japão': '81',
    'México': '52',
    'Noruega': '47',
    'Nova Zelândia': '64',
    'Paraguai': '595',
    'Peru': '51',
    'Reino Unido': '44',
    'Rússia': '7',
    'Suécia': '46',
    'Suíça': '41',
    'Tailândia': '66',
    'Turquia': '90',
    'Venezuela': '58',
  };

  @override
  void initState() {
    super.initState();
    telefoneController.addListener(() {
      if (dddSelecionado.isNotEmpty &&
          !telefoneController.text.startsWith('($dddSelecionado) ')) {
        telefoneController.text = '($dddSelecionado) ';
        telefoneController.selection = TextSelection.fromPosition(
          TextPosition(offset: telefoneController.text.length),
        );
      }
    });
  }

  Future<dynamic> sendToken(String token) async {
    var url =
        Uri.http(dotenv.env['API_URL']!.trim(), '/user/verification/$token');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({}),
    );

    if (response.statusCode != 200) {
      return response.statusCode;
    }

    var data = jsonDecode(response.body);
    return data['id'];
  }

  Future<void> sendData(
      String name, String email, String password, String numero) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');

    if (token == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text("Usuário não autenticado."),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    final id = await sendToken(token);
    final update =
        User(name: name, email: email, password: password, phone: numero);

    var url = Uri.http(dotenv.env['API_URL']!.trim(), "/user/update/$id");
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(update.toJson()),
    );

    if (response.statusCode != 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text("Ops, algo deu errado. Erro: ${response.body}"),
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', data);
      nomeController.clear();
      emailController.clear();
      senhaController.clear();
      telefoneController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text("Conta Atualizada com sucesso ${response.body}"),
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return data;
    }
    return;
  }

  void _saveData() async {
    String nome = nomeController.text;
    String email = emailController.text;
    String senha = senhaController.text;
    String telefone = telefoneController.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (nome.isEmpty || email.isEmpty || senha.isEmpty || telefone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text("Por favor, preencha todos os campos."),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    await sendData(nome, email, senha, telefone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Color.fromARGB(255, 153, 0, 255),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        centerTitle: true,
        title: const Text(
          'Editar perfil',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.account_circle_rounded,
              size: 120,
              color: Colors.white,
            ),
            const SizedBox(height: 60),
            buildTextField('Nome', Icons.person, nomeController),
            const SizedBox(height: 50),
            buildTextField('Email', Icons.email_rounded, emailController),
            const SizedBox(height: 50),
            buildTextField('Senha', Icons.lock, senhaController,
                obscureText: true),
            const SizedBox(height: 50),
            buildCountrySelector(),
            const SizedBox(height: 50),
            buildPhoneNumberField(),
            const SizedBox(height: 120),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveData,
        backgroundColor: const Color(0xFF8400FF),
        shape: const CircleBorder(),
        child: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget buildTextField(
      String label, IconData icon, TextEditingController controller,
      {bool obscureText = false}) {
    return Row(
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(color: Color(0xFF8400FF), offset: Offset(0, 2)),
              ],
            ),
            child: TextField(
              controller: controller,
              style: const TextStyle(color: Colors.white),
              obscureText: obscureText,
              decoration: InputDecoration(
                fillColor: Colors.black,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                labelText: label,
                labelStyle: const TextStyle(color: Color(0xFF979797)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCountrySelector() {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.black,
              title: const Text('Selecione um País',
                  style: TextStyle(color: Colors.white)),
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: Color.fromRGBO(132, 0, 255, 1), width: 5),
                borderRadius: BorderRadius.circular(20),
              ),
              content: SizedBox(
                width: double.maxFinite,
                child: ListView(
                  children: dddMap.keys.map((pais) {
                    return ListTile(
                      title: Text(pais,
                          style: const TextStyle(color: Colors.white)),
                      onTap: () {
                        setState(() {
                          paisSelecionado = pais;
                          dddSelecionado = dddMap[pais]!;
                          telefoneController.text = '($dddSelecionado) ';
                        });
                        Navigator.of(context).pop();
                      },
                    );
                  }).toList(),
                ),
              ),
            );
          },
        );
      },
      child: Row(
        children: [
          const Icon(Icons.public, color: Colors.white),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(color: Color(0xFF8400FF), offset: Offset(0, 2)),
                ],
              ),
              child: TextField(
                enabled: false,
                style: const TextStyle(color: Colors.white, fontSize: 18),
                decoration: InputDecoration(
                  fillColor: Colors.black,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  labelText: paisSelecionado,
                  labelStyle: const TextStyle(color: Color(0xFF979797)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPhoneNumberField() {
    return Row(
      children: [
        const Icon(Icons.call_rounded, color: Colors.white),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(color: Color(0xFF8400FF), offset: Offset(0, 2)),
              ],
            ),
            child: TextField(
              controller: telefoneController,
              enabled: dddSelecionado.isNotEmpty,
              style: const TextStyle(color: Colors.white, fontSize: 18),
              decoration: InputDecoration(
                fillColor: Colors.black,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                labelText: 'Número de telefone',
                labelStyle: const TextStyle(color: Color(0xFF979797)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
