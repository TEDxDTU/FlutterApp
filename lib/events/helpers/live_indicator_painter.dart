import 'dart:math' as math;

import 'package:flutter/material.dart';

extension DrawCustomArcs on Canvas {
  void drawAngledArcsOnRadius(Offset offset, double radius, Paint paint) {
    Rect rect = Rect.fromCircle(center: offset, radius: radius);
    drawArc(rect, -(math.pi / 3), 2 * math.pi / 3, false, paint);
    drawArc(rect, 2 * math.pi / 3, 2 * math.pi / 3, false, paint);
  }
}

/// Draws a live indicator
class LiveIndicatorPainter extends CustomPainter {
  ///No of arcs to paint
  final int noOfArcs;
  LiveIndicatorPainter(this.noOfArcs);

  var hollowPaint = Paint()
    ..color = const Color(0xffE62B1E)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2;

  var filledPaint = Paint()
    ..color = const Color(0xffE62B1E)
    ..style = PaintingStyle.fill
    ..strokeWidth = 2;

  @override
  void paint(Canvas canvas, Size size) {
    double maxRadius = math.min(size.width, size.height) / 2;
    Offset center = Offset(maxRadius, maxRadius);
    double centerSize = 3.5;
    canvas.drawCircle(center, centerSize, filledPaint);
    for (int i = 1; i <= noOfArcs; i++) {
      canvas.drawAngledArcsOnRadius(
          center, centerSize + maxRadius * i / noOfArcs, hollowPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
