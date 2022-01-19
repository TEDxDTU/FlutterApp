import 'package:flutter/cupertino.dart';

class SignUpImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double val = 0.7;
    path.lineTo(0, size.height * val);

    path.quadraticBezierTo(
        size.width / 2, size.height * (2 - val), size.width, size.height * val);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
