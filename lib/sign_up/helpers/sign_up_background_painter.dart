import 'package:flutter/material.dart';

class SignUpBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.white;
    paint.style = PaintingStyle.fill;
    var width = size.width;
    var height = size.height;
    paint.strokeWidth = 3;
    // var path = Path();
    // var path = Path()
    //   ..moveTo(0, 0)
    //   ..quadraticBezierTo(
    //     width * 0.225,
    //     height * 0.43,
    //     width * 0.4,
    //     height * 0.3,
    //   )
    //   ..quadraticBezierTo(
    //     width * 0.6,
    //     height * 0.1,
    //     width * 0.76,
    //     height * 0.3,
    //   )
    //   ..quadraticBezierTo(
    //     width * 0.9,
    //     height * 0.5,
    //     width,
    //     height * 0.5,
    //   );
    // canvas.drawPath(path, paint);
    var path = Path();
    paint.color = Colors.red;
    path.lineTo(width, height * 0.3);
    path
      ..quadraticBezierTo(
        width * 0.8,
        height * 0.3,
        width * 0.7,
        height * 0.5,
      )
      ..quadraticBezierTo(
        width * 0.6,
        height * 0.6,
        width * 0.44,
        height * 0.5,
      )
      ..quadraticBezierTo(
        width * 0.2,
        height * 0.3,
        0,
        height * 0.3,
      )
      ..moveTo(width, height * 0.3)
      ..lineTo(width, 0)
      ..lineTo(0, 0);
    canvas.drawPath(path, paint);

    // path = Path();
    // paint.color = Colors.white;
    // path
    //   ..moveTo(0, height * 0.5)
    //   ..quadraticBezierTo(
    //     width * 0.2,
    //     height * 0.4,
    //     width * 0.3,
    //     height * 0.7,
    //   )
    //   ..quadraticBezierTo(
    //     width * 0.4,
    //     height * 0.9,
    //     width * 0.5,
    //     height * 0.7,
    //   )
    //   ..quadraticBezierTo(
    //     width * 0.7,
    //     height * 0.4,
    //     width * 0.8,
    //     height * 0.7,
    //   )
    //   ..quadraticBezierTo(
    //     width * 0.9,
    //     height * 0.9,
    //     width,
    //     height * 0.6,
    //   );

    // canvas.drawPath(path, paint);
    // paint.color = Colors.white70;
    // path = Path()
    //   ..moveTo(0, 0)
    //   ..quadraticBezierTo(
    //     width * 0.375,
    //     height * 0.83,
    //     width,
    //     height,
    //   )
    //   ..lineTo(width, 0)
    //   ..close();
    //   ..moveTo(width * 0.45, 0)
    //   ..quadraticBezierTo(width * 0.4, 0, width * 0.22, height * 0.15)
    //   ..quadraticBezierTo(0, height * 0.4, width * 0.51, height * 0.3)
    //   ..quadraticBezierTo(
    //     width * 0.85,
    //     height * 0.2,
    //     width * 0.88,
    //     height * 0.5,
    //   )
    //   ..quadraticBezierTo(
    //     width * 0.48,
    //     height * 0.65,
    //     width * 0.54,
    //     height * 0.67,
    //   )
    //   ..lineTo(width, height)
    //   ..lineTo(width, 0);
    // canvas.drawPath(path, paint);
    // paint.style = PaintingStyle.stroke;
    // paint.strokeWidth = 3;
    // var path = Path();
    // var width = size.width;
    // var height = size.height;
    // path.moveTo(0, height);
    // path.lineTo(width, height * 0.7);
    // path.moveTo(0, height * 0.55);
    // path.lineTo(width, height * 0.65);
    // path.moveTo(0, height * 0.27);
    // path.lineTo(width, height * 0.4);
    // path.moveTo(0, height * 0.27);
    // path.lineTo(width, height * 0.8);

    // // path.lineTo(0, height * 0.55);
    // path.moveTo(width, height * 0.27);
    // path.lineTo(0, height * 0.7);
    // path.moveTo(width, height * 0.27);
    // path.lineTo(0, height * 0.1);
    // path.moveTo(width * 0.2, height);
    // path.lineTo(width, height * 0.9);
    // path.moveTo(0, height * 0.7);
    // path.lineTo(width, height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(SignUpBackgroundPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(SignUpBackgroundPainter oldDelegate) => false;
}
