import 'package:flutter/material.dart';

class LabelledWidget extends StatelessWidget {
  const LabelledWidget({
    Key? key,
    required this.label,
    required this.child,
  }) : super(key: key);
  final String label;
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
