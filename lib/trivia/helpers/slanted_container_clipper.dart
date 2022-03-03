import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlantedContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    final width = size.width;
    final height = size.height;
    path.moveTo(0, height * 0.3);
    path.lineTo(width * 0.35, height * 0.3);

    path.quadraticBezierTo(
        width * 0.42, height * 0.3, width * 0.47, height * 0.5);
    path.lineTo(width * 0.55, height * 0.88);
    path.quadraticBezierTo(width * 0.58, height, width * 0.68, height);
    path.lineTo(width, height);
    path.lineTo(width, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
