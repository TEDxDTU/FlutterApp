import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GrabbingClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.2606873, size.height * 0.8855058);
    path_0.lineTo(size.width * 0.01550388, size.height * 0.8855058);
    path_0.lineTo(size.width * 0.01550388, size.height * 0.008670520);
    path_0.lineTo(size.width * 0.9844961, size.height * 0.008670520);
    path_0.lineTo(size.width * 0.9844961, size.height * 0.8855058);
    path_0.lineTo(size.width * 0.7367339, size.height * 0.8855058);
    path_0.cubicTo(
        size.width * 0.7161059,
        size.height * 0.8855058,
        size.width * 0.6963282,
        size.height * 0.8947023,
        size.width * 0.6817804,
        size.height * 0.9110578);
    path_0.lineTo(size.width * 0.6561059, size.height * 0.9399191);
    path_0.cubicTo(
        size.width * 0.6367080,
        size.height * 0.9617283,
        size.width * 0.6103385,
        size.height * 0.9739884,
        size.width * 0.5828346,
        size.height * 0.9739884);
    path_0.lineTo(size.width * 0.4987106, size.height * 0.9739884);
    path_0.lineTo(size.width * 0.4145840, size.height * 0.9739884);
    path_0.cubicTo(
        size.width * 0.3870827,
        size.height * 0.9739884,
        size.width * 0.3607132,
        size.height * 0.9617283,
        size.width * 0.3413127,
        size.height * 0.9399191);
    path_0.lineTo(size.width * 0.3156408, size.height * 0.9110578);
    path_0.cubicTo(
        size.width * 0.3010904,
        size.height * 0.8947023,
        size.width * 0.2813152,
        size.height * 0.8855058,
        size.width * 0.2606873,
        size.height * 0.8855058);
    path_0.close();
    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
