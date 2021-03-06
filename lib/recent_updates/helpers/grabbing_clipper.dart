import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GrabbingClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(
      size.width * 0.2606873,
      size.height * 0.9202918,
    );
    path.lineTo(
      size.width * 0,
      size.height * 0.9202918,
    );
    path.lineTo(
      size.width * 0,
      size.height * 0,
    );
    path.lineTo(
      size.width * 1,
      size.height * 0,
    );
    path.lineTo(
      size.width * 1,
      size.height * 0.9202918,
    );
    path.lineTo(
      size.width * 0.7367339,
      size.height * 0.9202918,
    );
    path.cubicTo(
      size.width * 0.7161059,
      size.height * 0.9202918,
      size.width * 0.6963282,
      size.height * 0.9266942,
      size.width * 0.6817804,
      size.height * 0.9380805,
    );
    path.lineTo(
      size.width * 0.6561059,
      size.height * 0.9581730,
    );
    path.cubicTo(
      size.width * 0.6367080,
      size.height * 0.9733561,
      size.width * 0.6103385,
      size.height * 1,
      size.width * 0.5828346,
      size.height * 1,
    );
    path.lineTo(
      size.width * 0.4987106,
      size.height * 1,
    );
    path.lineTo(
      size.width * 0.4145840,
      size.height * 1,
    );
    path.cubicTo(
      size.width * 0.3870827,
      size.height * 1,
      size.width * 0.3607132,
      size.height * 0.9733561,
      size.width * 0.3413127,
      size.height * 0.9581730,
    );
    path.lineTo(
      size.width * 0.3156408,
      size.height * 0.9380805,
    );
    path.cubicTo(
      size.width * 0.3010904,
      size.height * 0.9266942,
      size.width * 0.2813152,
      size.height * 0.9202918,
      size.width * 0.2606873,
      size.height * 0.9202918,
    );
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
