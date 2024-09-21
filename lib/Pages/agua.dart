// import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';

class AguaPage extends StatefulWidget {
  const AguaPage({super.key});

  @override
  State<AguaPage> createState() => _AguaPageState();

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

class _AguaPageState extends State<AguaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // bottomNavigationBar: FancyBottomNavigation(
      //   activeIconColor: const Color.fromARGB(255, 255, 255, 255),
      //   circleColor: const Color.fromARGB(255, 91, 0, 196),
      //   barBackgroundColor: const Color.fromARGB(255, 119, 0, 255),
      //   inactiveIconColor: const Color.fromARGB(255, 255, 255, 255),
      //   tabs: [
      //     TabData(iconData: Icons.water_drop, title: ""),
      //     TabData(iconData: Icons.calendar_month, title: ""),
      //     TabData(iconData: Icons.food_bank, title: ""),
      //     TabData(iconData: Icons.shopping_cart, title: ""),
      //     // TabData(iconData: Icons.menu, title: ""),
      //   ],
      //   onTabChangedListener: (position) {
      //     setState(() {
      //       // currentPage = position;
      //     });
      //   },
      // ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildHeader(),
            const Spacer(),
            _buildWaterIntakeBox(),
            const Spacer(),
            const SizedBox(height: 20),
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
        // Transform.translate(
        //   offset: const Offset(-90, -10),
        //   child: Image.asset(
        //     'assets/VitaValoreLogo.jpeg',
        //     height: 60,
        //   ),
        // ),
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
            AguaPage._buildWaterIntakeRow("8:00", "400ml"),
            const SizedBox(height: 20),
            AguaPage._buildWaterIntakeRow("12:00", "400ml"),
            const SizedBox(height: 20),
            AguaPage._buildWaterIntakeRow("16:00", "400ml"),
            const SizedBox(height: 20),
            AguaPage._buildWaterIntakeRow("20:00", "400ml"),
          ],
        ),
      ),
    );
  }
}
