import 'dart:math';

import 'package:flutter/material.dart';

class RotatingWidget extends StatefulWidget {
  const RotatingWidget({
    Key? key,
    required this.child,
    required this.duration,
  }) : super(key: key);
  final Widget child;
  final Duration duration;

  @override
  State<RotatingWidget> createState() => RotatingWidgetState();
}

class RotatingWidgetState extends State<RotatingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.duration);
    super.initState();
  }

  Future<void> start() async {
    await _controller.forward();
    _controller.reset();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (ctx, child) {
        print("building animated builder ${_controller.value}");
        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(
              pi / 2 * (_controller.value),
            ),
          // scale: _controller.value,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
