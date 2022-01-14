import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Draws a live indicator
class LiveIndicatorPainter extends CustomPainter {
  var hollowPaint = Paint()
    ..color = const Color(0xffE62B1E)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2;

  var filledPaint = Paint()
    ..color = const Color(0xffE62B1E)
    ..style = PaintingStyle.fill
    ..strokeWidth = 2;

  var innerRect = Rect.fromCircle(center: Offset.zero, radius: 8);

  var outerRect = Rect.fromCircle(center: Offset.zero, radius: 12);
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset.zero, 4.5, filledPaint);
    canvas.drawArc(
      innerRect,
      -(math.pi / 3),
      2 * math.pi / 3,
      false,
      hollowPaint,
    );
    canvas.drawArc(
      innerRect,
      2 * math.pi / 3,
      2 * math.pi / 3,
      false,
      hollowPaint,
    );
    canvas.drawArc(
      outerRect,
      -(math.pi / 3),
      2 * math.pi / 3,
      false,
      hollowPaint,
    );
    canvas.drawArc(
      outerRect,
      2 * math.pi / 3,
      2 * math.pi / 3,
      false,
      hollowPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
