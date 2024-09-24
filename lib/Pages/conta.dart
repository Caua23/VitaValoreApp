import 'package:flutter/material.dart';

class ContaPage extends StatelessWidget {
  const ContaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded,
              color: Color.fromARGB(255, 153, 0, 255)),
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
              fontFamily: 'assets/fonts/Monserrat',
              fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.account_circle_rounded,
              size: 120,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            const SizedBox(height: 30),
            // Campo de Nome
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 132, 0, 255),
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: SizedBox(
                height: 50,
                width: 325,
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    fillColor: Colors.black,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    labelText: "Nome",
                    labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 151, 151, 151)),
                    prefixIcon: const Icon(Icons.person, color: Colors.white),
                    prefixIconConstraints: const BoxConstraints(
                      minWidth:
                          50, // Define o espaçamento entre o ícone e o texto
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            // Campo de Email
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 132, 0, 255),
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: SizedBox(
                height: 50,
                width: 325,
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    fillColor: Colors.black,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    labelText: "Email",
                    labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 151, 151, 151)),
                    prefixIcon:
                        const Icon(Icons.email_rounded, color: Colors.white),
                    prefixIconConstraints: const BoxConstraints(
                      minWidth:
                          50, // Define o espaçamento entre o ícone e o texto
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            // Campo de Password
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 132, 0, 255),
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: SizedBox(
                height: 50,
                width: 325,
                child: TextField(
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    fillColor: Colors.black,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    labelText: "Password",
                    labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 151, 151, 151)),
                    prefixIcon: const Icon(Icons.lock, color: Colors.white),
                    prefixIconConstraints: const BoxConstraints(
                      minWidth:
                          50, // Define o espaçamento entre o ícone e o texto
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            // Campo de Número de Celular
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 132, 0, 255),
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: SizedBox(
                height: 50,
                width: 325,
                child: TextField(
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    fillColor: Colors.black,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    labelText: "Número de celular (Opcional)",
                    labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 151, 151, 151)),
                    prefixIcon:
                        const Icon(Icons.call_rounded, color: Colors.white),
                    prefixIconConstraints: const BoxConstraints(
                      minWidth:
                          50, // Define o espaçamento entre o ícone e o texto
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
