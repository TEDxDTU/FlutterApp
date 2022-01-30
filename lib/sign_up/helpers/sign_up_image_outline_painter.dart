import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/sign_up/helpers/sign_up_image_clipper.dart';

class SignUpImageOutlinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.red;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    var path = SignUpImageClipper().getClip(size);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
