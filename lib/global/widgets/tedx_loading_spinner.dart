import 'dart:math';

import 'package:flutter/material.dart';

class TedxLoadingSpinner extends StatefulWidget {
  const TedxLoadingSpinner({Key? key}) : super(key: key);

  @override
  _TedxLoadingSpinnerState createState() => _TedxLoadingSpinnerState();
}

class _TedxLoadingSpinnerState extends State<TedxLoadingSpinner>
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
    // setState(() {
    //   isExiting = true;
    // });
    // Future.delayed(Duration(milliseconds: totalTime.toInt()), () {
    // });
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
        ElevatedButton(
          onPressed: () {
            setState(() {
              _animationController.value = 0;
              _animationController.repeat(reverse: true);
              isExiting = !isExiting;
            });
          },
          child: Text("Translate"),
        ),
      ],
    );
  }
}
