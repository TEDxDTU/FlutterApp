import 'package:flutter/material.dart';

class ExpandedFlex extends Flex {
  ExpandedFlex({
    Key? key,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
    required List<Widget> children,
    required List<int> flexes,
    required Axis direction,
  }) : super(
          children: children.map<Widget>((child) {
            final index = children.indexOf(child);
            return Expanded(
              flex: flexes[index],
              child: child,
            );
          }).toList(),
          key: key,
          direction: direction,
          mainAxisAlignment: mainAxisAlignment,
          mainAxisSize: mainAxisSize,
          crossAxisAlignment: crossAxisAlignment,
          textDirection: textDirection,
          verticalDirection: verticalDirection,
          textBaseline: textBaseline,
        );
}
