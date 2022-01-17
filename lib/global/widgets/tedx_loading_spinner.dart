import 'dart:math';

import 'package:flutter/material.dart';

/// Provides a Loading Spinner animation with a rotating 'x' in TEDx.
///
/// To use this widget like a normal animation widget with just the x rotating,
/// use this widget like a [CircularProgressIndicator].
///
/// To implement the x flying out of the screen after completing a future, chain
/// the future with [TedxLoadingSpinnerState.translate].
///
/// Note that this animation delays the future by an additional amount of time
/// for smooth animation of the x, use with caution.
///
/// A basic implementation of this animation would be like this:
///
/// FutureBuilder(
///
///            // In future, a future call is to be passed, and must be chained
///            // with the awaited translate method present in [TedxLoadingSpinner]
///            // for the x in TEDx to fly out of the screen.
///            // For just the TEDx logo with x spinning and then disappearing, use
///            // this widget like you would use [CircularProgressIndicator].
///            future:
///                Future.delayed(const Duration(seconds: 5)).then((value) async {
///              await tedxLoadingSpinnerKey.currentState!.translate();
///              return value;
///            }),
///            builder: (context, snapshot) {
///              if (snapshot.connectionState == ConnectionState.waiting) {
///                return TedxLoadingSpinner(key: tedxLoadingSpinnerKey);
///              }
///              return const Text('Hey! Sorry for the delay.');
///            }),
///
class TedxLoadingSpinner extends StatefulWidget {
  ///Creates a TedXLoadingSpinner, a TedX logo with a spinning x.
  const TedxLoadingSpinner({Key? key}) : super(key: key);

  @override
  TedxLoadingSpinnerState createState() => TedxLoadingSpinnerState();
}

class TedxLoadingSpinnerState extends State<TedxLoadingSpinner>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  // Initial speed of the animation.
  double initialSpeed = 20;

  /// Deceleration of the animation.
  double deceleration = 10;

  /// Total time of the animation.
  double totalTime = 3000;

  bool isExiting = false;

  /// Returns the distance as a function of the [time], [initialSpeed]
  /// and [deceleration] as taken in function input.
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

  /// Makes the x fly out of the screen.
  Future<void> translate([int width = 400]) async {
    // unit is the translation value of x
    // int unit = 700;

    // time is the value which is taken by x to reach half of the screen width
    // (i.e. to the extreme end of screen).
    // int time = 0;

    // i is used to evaluate the value of time.

    // TODO: Fine tune this value of time.
    // This is a try to optimally caluclate the translating time of the x
    // This has been tested in the
    // int i = 1;
    // while (time < unit) {
    //   time = ((unit * i / (3 * width)) * 1000).toInt();
    //   i *= 2;
    // }
    setState(() {
      _animationController.value = 0;
      _animationController.repeat(reverse: true);
      isExiting = !isExiting;
    });
    // This value works well for tablets with 8.7" screen.
    await Future.delayed(const Duration(milliseconds: 2000));
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
