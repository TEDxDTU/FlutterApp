import 'package:flutter/cupertino.dart';

class GrabbingClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width * 0.33;
    Path path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.2);
    path.lineTo(size.width - width, size.height * 0.2);

    // TODO: Add quadratic beziers here

    // print('curr pos: ${size.width - width}, ${size.height * 0.2}');

    // print(
    //     'reference point: ${size.width - width} ${size.height * (0.2 + 0.4)}}');
    // print(
    //     'moveTo: ${size.width - width - width * 0.1} ${size.height * (0.2 + 0.4)}');

    // path.quadraticBezierTo(
    //   size.width - width,
    //   size.height * (0.2 + 0.4),
    //   size.width - width - width * 0.1,
    //   size.height * (0.2 + 0.4),
    // );
    path.lineTo(
      size.width - width - width * 0.1,
      size.height * (0.2 + 0.4),
    );
    path.lineTo(
      size.width - width - width * 0.2,
      size.height,
    );
    path.lineTo(
      size.width - width * 2 + width * 0.2,
      size.height,
    );
    path.lineTo(
      size.width - width * 2 + width * 0.2 - width * 0.1,
      size.height - size.height * 0.4,
    );
    path.lineTo(
      size.width - width * 2 + width * 0.2 - width * 0.2,
      size.height - size.height * 0.8,
    );
    path.lineTo(
      0,
      size.height - size.height * 0.8,
    );

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
