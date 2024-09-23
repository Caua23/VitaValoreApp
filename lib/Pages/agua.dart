import 'package:flutter/material.dart';
import 'package:vita_valore/Widget/arc_progress.dart';
import 'dart:math' as math;

class AguaPage extends StatefulWidget {
  const AguaPage({super.key});

  @override
  State<AguaPage> createState() => _AguaPageState();

  static Widget _buildWaterIntakeRow(String time, String amount,
      VoidCallback onPressed, IconData icon, bool isClickable) {
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
        IconButton(
          icon: Icon(icon, color: Colors.white),
          onPressed: isClickable ? onPressed : null,
        ),
        const SizedBox(width: 30),
      ],
    );
  }
}

class _AguaPageState extends State<AguaPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double progress = 0.0;
  final double maxProgress = math.pi;
  List<bool> clickedIcons = List.filled(4, false);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  void increaseProgress(int index) {
    if (!clickedIcons[index]) {
      setState(() {
        clickedIcons[index] = true; // Marca o ícone como clicado
        progress += maxProgress * 0.25; // Cada botão adiciona 25% do máximo
        if (progress > maxProgress) {
          progress = maxProgress;
        }
      });

      // Inicia a animação do progresso
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildHeader(),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                double currentProgress = progress * _controller.value;
                return ArcProgress(progress: currentProgress);
              },
            ),
            const SizedBox(height: 20),
            const Spacer(),
            _buildWaterIntakeBox(),
            const Spacer(),
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
            height: 135,
          ),
        ),
      ],
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
            AguaPage._buildWaterIntakeRow(
                "8:00",
                "400ml",
                () => increaseProgress(0),
                clickedIcons[0] ? Icons.check : Icons.add_box_outlined,
                !clickedIcons[0]),
            const SizedBox(height: 15),
            AguaPage._buildWaterIntakeRow(
                "12:00",
                "400ml",
                () => increaseProgress(1),
                clickedIcons[1] ? Icons.check : Icons.add_box_outlined,
                !clickedIcons[1]),
            const SizedBox(height: 15),
            AguaPage._buildWaterIntakeRow(
                "16:00",
                "400ml",
                () => increaseProgress(2),
                clickedIcons[2] ? Icons.check : Icons.add_box_outlined,
                !clickedIcons[2]),
            const SizedBox(height: 15),
            AguaPage._buildWaterIntakeRow(
                "20:00",
                "400ml",
                () => increaseProgress(3),
                clickedIcons[3] ? Icons.check : Icons.add_box_outlined,
                !clickedIcons[3]),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
