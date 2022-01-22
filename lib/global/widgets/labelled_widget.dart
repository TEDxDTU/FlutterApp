import 'package:flutter/material.dart';

/// Utility widget that shows a label above its child
class LabelledWidget extends StatelessWidget {
  const LabelledWidget({
    Key? key,
    required this.label,
    required this.child,
  }) : super(key: key);

  /// The label to show above the child
  final String label;

  /// The child to show
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.subtitle1?.copyWith(
                fontSize: 15,
              ),
        ),
        child,
      ],
    );
  }
}
