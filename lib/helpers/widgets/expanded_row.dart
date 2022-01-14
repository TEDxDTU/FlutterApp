import 'package:flutter/material.dart';

import 'expanded_flex.dart';

class ExpandedRow extends ExpandedFlex {
  ///Creates an ExpandedColumn, a widget that displays its children in a
  ///horizontal array.Differs from [Row] in that it expands each child
  ///according to the given flexes.
  ///
  ///The [flexes] argument specifies the flex of each child. Flexes must be in
  ///the same order as the children. Each child will be expanded according to
  ///the flex of the corresponding index in the [flexes] list.
  ///For documentation about the various other parameters, see [Row].
  ExpandedRow({
    Key? key,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
    required List<Widget> children,
    required List<int> flexes,
  }) : super(
          children: children,
          key: key,
          direction: Axis.horizontal,
          mainAxisAlignment: mainAxisAlignment,
          mainAxisSize: mainAxisSize,
          crossAxisAlignment: crossAxisAlignment,
          textDirection: textDirection,
          verticalDirection: verticalDirection,
          textBaseline: textBaseline,
          flexes: flexes,
        );
}
