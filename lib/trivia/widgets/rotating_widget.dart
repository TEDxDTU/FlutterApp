import 'dart:math';

import 'package:flutter/material.dart';

class RotatingWidget extends StatefulWidget {
  const RotatingWidget({
    Key? key,
    required this.leftChild,
    required this.rightChild,
    required this.duration,
    required this.width,
  }) : super(key: key);
  final Widget leftChild;
  final Widget rightChild;
  final Duration duration;
  final double width;

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
    // _controller.reset();
    await _controller.forward();
    _controller.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //RED
        AnimatedBuilder(
          animation: _controller,
          builder: (ctx, child) {
            // print("building animated builder ${_controller.value}");
            return Transform.translate(
              offset: Offset(widget.width * (1 - _controller.value), 0),
              child: Transform(
                alignment: Alignment.centerLeft,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  // ..translate(widget.width * (_controller.value), 0.0)
                  ..rotateY(
                    -pi / 2 * (1 - _controller.value),
                  ),
                // ,
                // scale: _controller.value,
                child: child,
              ),
            );
          },
          child: widget.rightChild,
        ),
        // BLUE
        AnimatedBuilder(
          animation: _controller,
          builder: (ctx, child) {
            // print("building animated builder ${_controller.value}");
            return Transform.translate(
              offset: Offset(-widget.width * (_controller.value), 0.0),
              child: Transform(
                alignment: Alignment.centerRight,

                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  // ..translate(-widget.width * (1-_controller.value))
                  ..rotateY(
                    pi / 2 * (_controller.value),
                  ),
                // scale: _controller.value,
                child: child,
              ),
            );
          },
          child: widget.leftChild,
        ),
      ],
    );
  }
}
