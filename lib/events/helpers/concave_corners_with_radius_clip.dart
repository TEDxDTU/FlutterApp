import 'package:flutter/material.dart';

/// Creates a [CustomClipper] with concave corners, around a child.
///
/// Default [clipRadius] is 12.
///
/// Clip selectors are false by default.
class ConcaveCornersWithRadiusClip extends CustomClipper<Path> {
  const ConcaveCornersWithRadiusClip({
    this.topLeft = false,
    this.topRight = false,
    this.bottomLeft = false,
    this.bottomRight = false,
    this.clipRadius = 12.0,
  });

  /// Radius of the concave corner
  ///
  /// Defaults to 12.0 .
  final double clipRadius;

  /// Whether the top-left corner should be concaved-in.
  ///
  /// Defaults to false.
  final bool topLeft;

  /// Whether the top-right corner should be concaved-in.
  ///
  /// Defaults to false.
  final bool topRight;

  /// Whether the bottom-left corner should be concaved-in.
  ///
  /// Defaults to false.
  final bool bottomLeft;

  /// Whether the bottom-right corner should be concaved-in.
  ///
  /// Defaults to false.
  final bool bottomRight;

  @override
  Path getClip(Size size) {
    Path path = Path();

    // Draw top line.
    // Initialize to top left.
    path.moveTo(
      topLeft ? clipRadius : 0,
      0,
    );

    // Draw line from top left to top right.
    path.lineTo(
      topRight ? size.width - clipRadius : size.width,
      0,
    );
    if (topRight) {
      path.quadraticBezierTo(
        size.width - clipRadius,
        clipRadius,
        size.width,
        clipRadius,
      );
    }

    // Draw right line.
    // Draw line from top right to bottom right.
    path.lineTo(
      size.width,
      bottomRight ? size.height - clipRadius : size.height,
    );
    if (bottomRight) {
      path.quadraticBezierTo(
        size.width - clipRadius,
        size.height - clipRadius,
        size.width - clipRadius,
        size.height,
      );
    }

    // Draw bottom line.
    // Draw line from bottom right to bottom left.
    path.lineTo(
      bottomLeft ? clipRadius : 0,
      size.height,
    );
    if (bottomLeft) {
      path.quadraticBezierTo(
        clipRadius,
        size.height - clipRadius,
        0,
        size.height - clipRadius,
      );
    }

    // Draw left line
    // Draw line from bottom left to top left.
    path.lineTo(
      0,
      topLeft ? clipRadius : 0,
    );
    if (topLeft) {
      path.quadraticBezierTo(
        clipRadius,
        clipRadius,
        clipRadius,
        0,
      );
    }

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
