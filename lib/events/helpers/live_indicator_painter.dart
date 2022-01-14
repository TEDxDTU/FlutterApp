import 'dart:math' as math;

import 'package:flutter/material.dart';

extension DrawCustomArcs on Canvas {
  void drawAngledArcsOnRadius(double radius, Paint paint) {
    Rect rect = Rect.fromCircle(center: const Offset(0, 0), radius: radius);
    drawArc(rect, -(math.pi / 3), 2 * math.pi / 3, false, paint);
    drawArc(rect, 2 * math.pi / 3, 2 * math.pi / 3, false, paint);
  }
}

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

  // var innerRect = Rect.fromCircle(center: Offset.zero, radius: 40); //8

  // var outerRect = Rect.fromCircle(center: Offset.zero, radius: 60); //12
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset.zero, 4.5, filledPaint);
    canvas.drawAngledArcsOnRadius(8, hollowPaint);
    canvas.drawAngledArcsOnRadius(12, hollowPaint);

    // canvas.drawArc(
    //   innerRect,
    //   -(math.pi / 3),
    //   2 * math.pi / 3,
    //   false,
    //   hollowPaint,
    // );
    // canvas.drawArc(
    //   innerRect,
    //   2 * math.pi / 3,
    //   2 * math.pi / 3,
    //   false,
    //   hollowPaint,
    // );
    // canvas.drawArc(
    //   outerRect,
    //   -(math.pi / 3),
    //   2 * math.pi / 3,
    //   false,
    //   hollowPaint,
    // );
    // canvas.drawArc(
    //   outerRect,
    //   2 * math.pi / 3,
    //   2 * math.pi / 3,
    //   false,
    //   hollowPaint,
    // );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
