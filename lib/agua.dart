import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

List<Widget> _itensnavigationBar = [
  Image.asset('assets/agua.png', scale: 3),
  Image.asset('assets/calendario.png', scale: 3),
  Image.asset('assets/apple.png', scale: 3),
  Image.asset('assets/carrinho.png', scale: 3),
  Image.asset('assets/Drawer.png', scale: 3),
];

class AguaPage extends StatelessWidget {
  const AguaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: const Drawer(
        child: Text(""),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   color: const Color.fromARGB(255, 132, 0, 255),
      //   height: 60,
      //   child: Container(
      //     // padding: const EdgeInsets.all(20),
      //     color: const Color.fromARGB(255, 0, 0, 0),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         ElevatedButton(
      //             onPressed: () {},
      //             style: const ButtonStyle(
      //                 backgroundColor:
      //                     WidgetStatePropertyAll(Colors.transparent)),
      //             child: const Image(image: AssetImage('assets/agua.png'))),
      //         ElevatedButton(
      //             onPressed: () {},
      //             style: const ButtonStyle(
      //                 backgroundColor:
      //                     WidgetStatePropertyAll(Colors.transparent)),
      //             child:
      //                 const Image(image: AssetImage('assets/calendario.png'))),
      //         ElevatedButton(
      //             onPressed: () {},
      //             style: const ButtonStyle(
      //                 backgroundColor:
      //                     WidgetStatePropertyAll(Colors.transparent)),
      //             child: const Image(image: AssetImage('assets/apple.png'))),
      //         ElevatedButton(
      //             onPressed: () {},
      //             style: const ButtonStyle(
      //                 backgroundColor:
      //                     WidgetStatePropertyAll(Colors.transparent)),
      //             child: const Image(image: AssetImage('assets/carrinho.png'))),
      //       ],
      //     ),
      //   ),
      // ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        buttonBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        color: const Color.fromARGB(255, 255, 255, 255),
        items: _itensnavigationBar,
        onTap: (index) {
          if (kDebugMode) {
            print(index);
          }
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildHeader(),
            _buildWaterIntakeBox(),
            // _buildBottomContainer(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      children: [
        const Spacer(),
        Transform.translate(
          offset: const Offset(90, -20),
          child: Image.asset(
            'assets/Ze_gotinha_da_agua.png',
            height: 140,
          ),
        ),
        Transform.translate(
          offset: const Offset(-90, -10),
          child: Image.asset(
            'assets/VitaValoreLogo.jpeg',
            height: 60,
          ),
        ),
        _buildHeaderText("1h26min", const Offset(105, 45), 15),
        _buildHeaderText("800ml", const Offset(-35, 190), 13),
        _buildHeaderText("1.600ml", const Offset(145, 190), 16),
      ],
    );
  }

  Widget _buildHeaderText(String text, Offset offset, double fontSize) {
    return Transform.translate(
      offset: offset,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'assets/fonts/GlacialIndifference',
          fontSize: fontSize,
          color: const Color.fromARGB(255, 255, 255, 255),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildWaterIntakeBox() {
    return Transform.translate(
      offset: const Offset(0, 20),
      child: Container(
        width: 290,
        height: 220,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 6, 0, 12),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: const Color.fromRGBO(132, 0, 255, 1).withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 0,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildWaterIntakeRow("8:00", "400ml"),
            const SizedBox(height: 20),
            _buildWaterIntakeRow("12:00", "400ml"),
            const SizedBox(height: 20),
            _buildWaterIntakeRow("16:00", "400ml"),
            const SizedBox(height: 20),
            _buildWaterIntakeRow("20:00", "400ml"),
          ],
        ),
      ),
    );
  }

  static Widget _buildWaterIntakeRow(String time, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: 30),
        Text(
          time,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        Text(
          amount,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 30),
      ],
    );
  }
}
