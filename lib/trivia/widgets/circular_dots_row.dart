import 'package:flutter/material.dart';

enum CircularDotMode {
  SingleSelected,
  PreviousSelected,
}

class CircularDotsRow extends StatelessWidget {
  const CircularDotsRow({
    Key? key,
    required this.currentIndex,
    required this.maxIndex,
    this.mode = CircularDotMode.PreviousSelected,
  }) : super(key: key);

  final int currentIndex;
  final int maxIndex;
  final CircularDotMode mode;

  bool condition(int i) => (mode == CircularDotMode.PreviousSelected)
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
