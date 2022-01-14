import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredWidget extends StatelessWidget {
  ///Creates a blur widget, a widget that adds a blur effect behind its child.
  const BlurredWidget({
    Key? key,
    required this.child,
    required this.sigmaX,
    required this.sigmaY,
  }) : super(key: key);

  ///The child widget to be blurred.
  final Widget child;

  ///The sigma value for the X axis.
  final double sigmaX;

  ///The sigma value for the Y axis.
  final double sigmaY;
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
        child: child,
      ),
    );
  }
}
