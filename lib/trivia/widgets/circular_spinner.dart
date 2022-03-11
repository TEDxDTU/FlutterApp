import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:tedx_dtu_app/trivia/helpers/circular_spinner_painter.dart';
import 'package:tedx_dtu_app/trivia/widgets/animating_numbers.dart';

class CircularSpinner extends StatefulWidget {
  const CircularSpinner({
    Key? key,
    required this.onComplete,
  }) : super(key: key);
  final void Function() onComplete;
  @override
  State<CircularSpinner> createState() => _CircularSpinnerState();
}

class _CircularSpinnerState extends State<CircularSpinner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.rotate(
              angle: _controller.value * math.pi,
              child: child,
            );
          },
          child: CustomPaint(
            painter: CircularSpinnerPainter(),
            size: Size(300, 300),
            // child: AnimatingNumbers(),
          ),
        ),
        AnimatingNumbers(
          onComplete: widget.onComplete,
        ),
      ],
    );
  }
}
