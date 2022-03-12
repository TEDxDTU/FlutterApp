import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Creates a circle with gaps at equally spaced angles.
class CircularSpinnerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var hollowPaint = Paint()
      ..color = const Color(0xffE62B1E)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 17;
    double maxRadius = math.min(size.width, size.height) / 2;
    Offset center = Offset(maxRadius, maxRadius);
    Rect rect = Rect.fromCircle(center: center, radius: maxRadius);
    int n = 7;
    double gapWidth = math.pi / ((n));
    double start = -math.pi / 2;
    double sweep = (2 * math.pi - gapWidth * (n)) / n;

    for (int i = 0; i < n; i++) {
      canvas.drawArc(
        rect,
        start,
        sweep,
        false,
        hollowPaint,
      );
      start += sweep + gapWidth;
    }

    // canvas.drawArc(rect, -math.pi / 2, 2 * math.pi / 3, false, hollowPaint);
    // hollowPaint.color = Colors.white;
    // canvas.drawArc(rect, math.pi / 6, 2 * math.pi / 3, false, hollowPaint);
    // canvas.drawArc(rect, -math.pi / 2, 2 * math.pi / 3, false, hollowPaint);

    // canvas.drawArc(rect, 2 * math.pi / 3, 2 * math.pi / 3, false, hollowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
