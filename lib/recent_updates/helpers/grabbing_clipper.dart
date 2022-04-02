import 'dart:math' as math;

import 'package:flutter/cupertino.dart';

class GrabbingClipper extends CustomClipper<Path> {
  // Offset findMidpointOfArc(Offset begin, Offset end) {}

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    double middleWidth = size.width * 0.3; // Width off the middle section
    double extremumWidth =
        size.width * 0.1; // Width of the extreme left and extreme right space
    double qBezierWidth = size.width * 0.125; // width of the beziers
    double baseHeight = size.height * 0.3; // Height of base region
    double qBezierHeight = size.height * 0.35; // Height of beziers
    // double qBezierRadius = 50;

    // Draw a straight base line
    path.lineTo(size.width, 0);
    // Draw a vertical line to complete base region
    path.lineTo(size.width, baseHeight);
    // Draw a horizontal right extreme line
    path.lineTo(size.width - extremumWidth, baseHeight);
    // Draw a concave quadratic bezier on the right side
    // Starting point == [size.width - extremumWidth, baseHeight]
    // Ending point == [size.width - extremumWidth - qBezierWidth, baseHeight + qBezierHeight]
    // Control point == mid point of the arc

    // Offset rightFirstArc = findMidpointOfArc(
    //   Offset(size.width - extremumWidth, baseHeight),
    // Offset(
    //   size.width - extremumWidth - qBezierWidth,
    //   baseHeight + qBezierHeight,
    // ),
    // );

    // path.quadraticBezierTo(
    //   rightFirstArc.dx,
    //   rightFirstArc.dy,
    //   size.width - extremumWidth - qBezierWidth,
    //   baseHeight + qBezierHeight,
    // );

    path.lineTo(
      size.width - extremumWidth - qBezierWidth,
      baseHeight + qBezierHeight,
    );
    path.lineTo(
      size.width - extremumWidth - qBezierWidth - qBezierWidth,
      baseHeight + qBezierHeight + qBezierHeight,
    );

    // Middle line
    path.lineTo(
      size.width - extremumWidth - qBezierWidth - qBezierWidth - middleWidth,
      baseHeight + qBezierHeight + qBezierHeight,
    );

    path.lineTo(
      size.width -
          extremumWidth -
          qBezierWidth -
          qBezierWidth -
          middleWidth -
          qBezierWidth,
      baseHeight + qBezierHeight + qBezierHeight - qBezierHeight,
    );
    path.lineTo(
      size.width -
          extremumWidth -
          qBezierWidth -
          qBezierWidth -
          middleWidth -
          qBezierWidth -
          qBezierWidth,
      baseHeight +
          qBezierHeight +
          qBezierHeight -
          qBezierHeight -
          qBezierHeight,
    );
    path.lineTo(
      0,
      baseHeight +
          qBezierHeight +
          qBezierHeight -
          qBezierHeight -
          qBezierHeight,
    );

    // double width = size.width * 0.33;
    // Path path = Path();

    // // path.moveTo(0, 0);
    // // path.lineTo(size.width, 0);
    // // path.lineTo(size.width, size.height * 0.2);
    // // path.lineTo(size.width - width, size.height * 0.2);

    // // path.quadraticBezierTo(
    // //   size.width - width * 1.0753,
    // //   size.height * (0.2) + size.height * 0.433,
    // //   size.width - width - width * 0.1,
    // //   size.height * (0.2 + 0.4),
    // // );

    // // // path.lineTo(
    // // //   size.width - width - width * 0.1,
    // // //   size.height * (0.2 + 0.4),
    // // // );
    // // path.lineTo(
    // //   size.width - width - width * 0.2,
    // //   size.height,
    // // );
    // // path.lineTo(
    // //   size.width - width * 2 + width * 0.2,
    // //   size.height,
    // // );
    // // path.lineTo(
    // //   size.width - width * 2 + width * 0.2 - width * 0.1,
    // //   size.height - size.height * 0.4,
    // // );
    // // path.lineTo(
    // //   size.width - width * 2 + width * 0.2 - width * 0.2,
    // //   size.height - size.height * 0.8,
    // // );
    // // path.lineTo(
    // //   0,
    // //   size.height - size.height * 0.8,
    // // );

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
