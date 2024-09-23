import 'package:flutter/material.dart';
import 'dart:math' as math;

class ArcProgress extends StatelessWidget {
  final double progress; // Recebe o progresso da `AguaPage`

  const ArcProgress({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center, // Centraliza os arcos
      children: [
        // Fundo do progresso (branco)
        CustomPaint(
          size: const Size(180, 50),
          painter: ProgressArc(
              math.pi, const Color.fromARGB(255, 255, 255, 255), true),
        ),

        CustomPaint(
          size: const Size(180, 50),
          painter: ProgressArc(
              progress, const Color.fromARGB(255, 98, 0, 255), false),
        ),
      ],
    );
  }
}

class ProgressArc extends CustomPainter {
  final double arc;
  final Color progressColor;
  final bool background;

  ProgressArc(this.arc, this.progressColor, this.background);

  @override
  void paint(Canvas canvas, Size size) {
    const rect = Rect.fromLTWH(0, 0, 200, 200);
    const startAngle = -math.pi;
    final sweepAngle = arc; // Certificando que sempre haverá valor para o arco
    const useCenter = false;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = progressColor
      ..strokeWidth = 20;

    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
