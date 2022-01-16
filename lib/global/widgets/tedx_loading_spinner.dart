import 'dart:math';

import 'package:flutter/material.dart';

class TedxLoadingSpinner extends StatefulWidget {
  ///Creates a TedXLoadingSpinner, a TedX logo with a spinning x.
  const TedxLoadingSpinner({Key? key}) : super(key: key);

  @override
  TedxLoadingSpinnerState createState() => TedxLoadingSpinnerState();
}

class TedxLoadingSpinnerState extends State<TedxLoadingSpinner>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  double initialSpeed = 20;
  double deceleration = 10;
  double totalTime = 3000;

  bool isExiting = false;

  double angle(double time) {
    double val;
    int mult = 1;
    if (_animationController.status != AnimationStatus.forward) {
      time = 1 - time;
      mult = -1;
    }
    val = (initialSpeed * time - deceleration * time * time) * mult;
    return val - val.truncate();
  }

  Future<void> translate(int width) async {
    // unit is the translation value of x
    int unit = 700;

    // time is the value which is taken by x to reach half of the screen width
    // (i.e. to the extreme end of screen).
    int time = 0;

    // i is used to evaluate the value of time.

    // TODO: Fine tune this value of time.
    int i = 1;
    while (time < unit) {
      time = ((unit * i / (3 * width)) * 1000).toInt();
      i *= 2;
    }
    setState(() {
      _animationController.value = 0;
      _animationController.repeat(reverse: true);
      isExiting = !isExiting;
    });
    await Future.delayed(Duration(milliseconds: time));
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: totalTime.toInt()),
    );
    _animationController.repeat(
      reverse: true,
    );

    super.initState();
  }

  @override
  void dispose() {
    print("dispsing spinner");
    _animationController.dispose();
    super.dispose();
  }

  double yOffset = 12;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/ted.png',
          height: 80,
        ),
        AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              origin: Offset(
                  isExiting ? _animationController.value * 700 : 0, yOffset),
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateZ(
                  pi * angle(_animationController.value),
                )
                ..translate(isExiting ? _animationController.value * 700 : 0.0,
                    yOffset, 0.0),
              child: SizedBox(
                height: 30,
                child: Center(
                  child: Image.asset('assets/images/x.png'),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
