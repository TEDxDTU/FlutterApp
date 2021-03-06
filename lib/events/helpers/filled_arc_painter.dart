import 'dart:math' as math;
import 'dart:math';

import 'package:flutter/material.dart';

class FilledArcPainter extends CustomPainter {
  const FilledArcPainter({
    this.arcWidth = 18,
    this.fillColor = const Color(0xFF5E5E5E),
  });

  final double arcWidth;
  final Color fillColor;

  @override
  void paint(Canvas canvas, Size size) {
    var innerRadius = max(size.width, size.height);

    var paint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = arcWidth;
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(size.width, 0),
        radius: innerRadius,
      ),
      math.pi / 2,
      math.pi / 2,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
