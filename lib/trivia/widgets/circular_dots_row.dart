import 'package:flutter/material.dart';

enum CircularDotMode {
  singleSelected,
  previousSelected,
}

/// A widget that displays circular dots in a row, to be used to show the
/// progress of something in a discrete form, in the form 3/5 completed,
/// or 3/5th position. The dots are displayed in the form of a circle,
/// with the selected dot being a red solid circle, and the unselected dots
/// being white solid circles.
/// If [mode] is [CircularDotMode.singleSelected], then only one dot is
/// selected at a time. If [mode] is [CircularDotMode.previousSelected], then
/// all the dots before the [currentIndex],inclusive are selected.
class CircularDotsRow extends StatelessWidget {
  const CircularDotsRow({
    Key? key,
    required this.currentIndex,
    required this.maxIndex,
    this.mode = CircularDotMode.singleSelected,
  }) : super(key: key);

  final int currentIndex;
  final int maxIndex;
  final CircularDotMode mode;

  bool condition(int i) => (mode == CircularDotMode.previousSelected)
      ? (currentIndex >= i)
      : (currentIndex == i);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < maxIndex; i++)
          AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            width: condition(i) ? 12 : 8.0,
            height: condition(i) ? 12 : 8.0,
            margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  condition(i) ? Theme.of(context).primaryColor : Colors.white,
            ),
          ),
      ],
    );
  }
}
