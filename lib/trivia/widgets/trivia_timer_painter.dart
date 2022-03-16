import 'dart:math' as math;

import 'package:flutter/material.dart';

class TriviaTimerPainter extends CustomPainter {
  const TriviaTimerPainter(this.color, this.progress);
  final Color color;
  final double progress;
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = color;
    canvas.drawArc(
      Rect.fromLTWH(0.0, 0.0, size.width, size.height),
      -math.pi / 2,
      2 * progress * math.pi,
      true,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
