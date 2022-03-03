import 'package:flutter/material.dart';

class LabelledIcon extends StatelessWidget {
  const LabelledIcon({
    Key? key,
    required this.label,
    required this.icon,
  }) : super(key: key);

  final String label;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0).copyWith(bottom: 0, top: 0),
      child: Column(
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.caption,
          ),
          SizedBox(height: 6),
          icon,
        ],
      ),
    );
  }
}
