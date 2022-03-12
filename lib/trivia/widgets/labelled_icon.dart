import 'package:flutter/material.dart';

/// Displays a column with label and the icon.
class LabelledIcon extends StatelessWidget {
  const LabelledIcon({
    Key? key,
    required this.label,
    required this.icon,
    this.textColor,
  }) : super(key: key);

  final String label;
  final Icon icon;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0).copyWith(bottom: 0, top: 0),
      child: Column(
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.caption?.copyWith(
                  color: textColor,
                ),
          ),
          SizedBox(height: 6),
          icon,
        ],
      ),
    );
  }
}
