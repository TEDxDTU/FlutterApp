import 'dart:math';

import 'package:flutter/material.dart';

/// Rotates two widgets with 3D effect, like Instagram stories.
/// The [leftChild] widget is show initially, on transitioning it is transitioned
/// to the left, and the [rightChild] transitions into its place
class RotatingWidget extends StatefulWidget {
  const RotatingWidget({
    Key? key,
    required this.leftChild,
    required this.rightChild,
    required this.duration,
    required this.width,
  }) : super(key: key);

  /// The widget to show initially, will transition out of the screen.
  final Widget leftChild;

  /// The widget to show after the [leftChild] has transitioned out of the screen.
  /// Will transition from right to left during the transition.
  final Widget rightChild;

  /// The duration of the transition
  final Duration duration;

  /// The width of the widget. Should preferably be same for both children.
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

  /// Starts the transition. Also resets the animation controller, after the
  /// transition is complete, so make sure to change the parent widget tree
  /// by then.
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
