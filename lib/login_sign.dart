import 'package:flutter/material.dart';
import 'package:vita_valore/login.dart';

class LoginSing extends StatelessWidget {
  const LoginSing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 55),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Image.asset(
                  'assets/VitavaloreLogo.jpeg',
                  width: 250, // Largura da imagem
                  height: 250,
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35, vertical: 2),
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      color: Color(0xFF8400FF),
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 35),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 2),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Color(0xFF8400FF),
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
