import 'package:flutter/material.dart';

extension PaddingWidgetListExtension on List<Widget> {
  List<Widget> padded({
    required EdgeInsetsGeometry padding,
  }) {
    return map(
      (e) => Padding(
        padding: padding,
        child: e,
      ),
    ).toList();
  }
}
