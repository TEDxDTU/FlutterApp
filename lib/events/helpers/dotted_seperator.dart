import 'package:flutter/material.dart';

class DottedSeparator extends StatelessWidget {
  const DottedSeparator(
      {this.height = 1,
      this.lineColor = Colors.black,
      this.backgroundColor = const Color(0xff303030),
      Key? key})
      : super(key: key);

  final double height;
  final Color lineColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 10.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Container(
          color: backgroundColor,
          child: Flex(
            children: List.generate(dashCount, (_) {
              return SizedBox(
                width: dashWidth,
                height: dashHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: lineColor),
                ),
              );
            }),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
          ),
        );
      },
    );
  }
}
