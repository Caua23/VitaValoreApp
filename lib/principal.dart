import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vita_valore/Pages/agua.dart';
import 'package:vita_valore/Pages/calendario.dart';
import 'package:vita_valore/Pages/carrinho.dart';
import 'package:vita_valore/Pages/comida.dart';
import 'package:vita_valore/Pages/configuracao.dart';
import 'package:vita_valore/Pages/conta.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  final List<Widget> _pages = const [
    AguaPage(),
    CalendarioPage(),
    ComidaPage(),
    CarrinhoPage()
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    bool isCarrinho = _selectedIndex == 3;

    return Scaffold(
      appBar: isCarrinho
          ? null
          : AppBar(
              toolbarHeight: 80,
              title: _selectedIndex == 2
                  ? const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 45,
                          ),
                          Text(
                            "Calendário Diario",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontFamily: 'assets/fonts/Monserrat',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Row(
                      children: [
                        SizedBox(
                          height: 60,
                          child: Image.asset(
                            'assets/VitaValoreLogo2.png',
                            cacheHeight: 60,
                            cacheWidth: 60,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
              backgroundColor: _selectedIndex == 2
                  ? const Color.fromARGB(255, 132, 0, 255)
                  : const Color.fromARGB(255, 0, 0, 0),
              iconTheme: const IconThemeData(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
      endDrawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 78, 0, 167),
        child: Container(
          alignment: Alignment.center,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 70),
                const Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 255, 255, 255),
                  size: 80,
                ),
                const SizedBox(height: 70),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      shadowColor: MaterialStatePropertyAll(Colors.transparent),
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 78, 0, 167)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ConfiguracaoPage(),
                        ),
                      );
                    },
                    child: const Row(children: [
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Configurações",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ]),
                  ),
                ),
                const SizedBox(height: 70),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      shadowColor: MaterialStatePropertyAll(Colors.transparent),
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 78, 0, 167)),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ContaPage()));
                    },
                    child: const Row(
                      children: [
                        Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        SizedBox(width: 20),
                        Text(
                          "Sua Conta",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
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
