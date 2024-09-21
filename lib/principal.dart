import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vita_valore/Pages/agua.dart';
import 'package:vita_valore/Pages/calendario.dart';
import 'package:vita_valore/Pages/carrinho.dart';
import 'package:vita_valore/Pages/comida.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

List<Widget> _pages = <Widget>[
  const AguaPage(),
  const CalendarioPage(),
  const ComidaPage(),
  const CarrinhoPage()
];

class _PrincipalState extends State<Principal> {
  int _selectedIndex = 0; //New
  @override
  // 'assets/VitaValoreLogo.jpeg',
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Row(
          children: [
            SizedBox(
              height: 60,
              child: Image.asset(
                'assets/VitaValoreLogo2.png',
                fit: BoxFit.contain, // Mantém a proporção da imagem
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      endDrawer: const Drawer(
        backgroundColor: Color.fromARGB(255, 91, 0, 196),
      ),
      backgroundColor: Colors.black,
      body: _pages[_selectedIndex],
      bottomNavigationBar: FancyBottomNavigation(
        activeIconColor: const Color.fromARGB(255, 255, 255, 255),
        circleColor: const Color.fromARGB(255, 91, 0, 196),
        barBackgroundColor: const Color.fromARGB(255, 119, 0, 255),
        inactiveIconColor: const Color.fromARGB(255, 255, 255, 255),
        tabs: [
          TabData(iconData: Icons.water_drop, title: ""),
          TabData(iconData: Icons.calendar_month, title: ""),
          TabData(iconData: Icons.food_bank, title: ""),
          TabData(iconData: Icons.shopping_cart, title: ""),
        ],
        onTabChangedListener: (position) {
          setState(() {
            _selectedIndex = position;
            if (kDebugMode) {
              print(_selectedIndex);
            }
          });
        },
      ),
    );
  }
}
