import 'package:flutter/material.dart';

class DottedSeparator extends StatelessWidget {
  const DottedSeparator({
    this.height = 1,
    this.lineColor = Colors.black,
    this.backgroundColor = const Color(0xff303030),
    this.axis = Axis.horizontal,
    Key? key,
  }) : super(key: key);

  final double height;
  final Color lineColor;
  final Color backgroundColor;
  final Axis axis;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = axis == Axis.horizontal
            ? constraints.constrainWidth()
            : constraints.maxHeight;
        final double dashLength = 10;
        final double dashThickness = height;
        final dashCount = (boxWidth / (2 * dashLength)).floor();
        return Container(
          color: backgroundColor,
          child: Flex(
            children: List.generate(dashCount, (_) {
              return SizedBox(
                width: axis == Axis.horizontal ? dashLength : dashThickness,
                height: axis == Axis.horizontal ? dashThickness : dashLength,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: lineColor),
                ),
              );
            }),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: axis,
          ),
        );
      },
    );
  }
}
