import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlantedContainerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.white12;
    paint.style = PaintingStyle.fill; // TODO:Change this to stroke
    paint.strokeWidth = 1;

    var path = Path();
    final width = size.width;
    final height = size.height;
    path.moveTo(width * 0.3, height * 0.3);
    path.lineTo(width * 0.4, height * 0.3);
    path.lineTo(width * 0.4, 0);
    path.lineTo(width * 0.3, 0);
    // path.lineTo(0, 0);
    path.close();
    canvas.drawPath(path, paint);
    path = Path();

    paint.color = Colors.white54;
    path.moveTo(width * 0.35, height * 0.3);
    path.lineTo(width * 0.5, height);
    path.lineTo(width, height);
    path.lineTo(width, 0);
    path.lineTo(width * 0.35, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
