import 'package:flutter/material.dart';

class ExpandedFlex extends Flex {
  ///Creates an ExpandedFlex, a widget that displays its children in a 1-d
  ///array. Expands each child according to the flexes provided in [flexes]

  ///The [flexes] argument specifies the flex of each child. Flexes must be in
  ///the same order as the children. Each child will be expanded according to
  ///the flex of the corresponding index in the [flexes] list.
  ///For documentation about the various other parameters, see [Flex].
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
