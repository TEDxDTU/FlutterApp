import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredWidget extends StatelessWidget {
  const BlurredWidget({
    Key? key,
    required this.child,
    required this.sigmaX,
    required this.sigmaY,
  }) : super(key: key);
  final Widget child;
  final double sigmaX;
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
