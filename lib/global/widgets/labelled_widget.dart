import 'package:flutter/material.dart';

/// Utility widget that shows a label above its child
class LabelledWidget extends StatelessWidget {
  const LabelledWidget({
    Key? key,
    required this.label,
    this.labelStyle,
    required this.child,
    this.spacing = 0.0,
  }) : super(key: key);

  /// The label to show above the child
  final String label;

  final TextStyle? labelStyle;

  /// The child to show
  final Widget child;

  /// The spacing between the label and the child
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: labelStyle ??
              Theme.of(context).textTheme.subtitle1?.copyWith(
                    fontSize: 15,
                  ),
        ),
        SizedBox(height: spacing),
        child,
      ],
    );
  }
}
