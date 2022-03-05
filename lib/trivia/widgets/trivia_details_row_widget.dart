import 'package:flutter/material.dart';

import 'labelled_icon.dart';

class TriviaDetailsRowWidget extends StatelessWidget {
  TriviaDetailsRowWidget({
    Key? key,
    required this.questionCount,
    required this.totalTime,
    Color? iconColor,
    Color? dividerColor,
  })  : iconColor = iconColor ?? Colors.blueGrey[100]!,
        dividerColor = dividerColor ?? Colors.blueGrey[200]!,
        super(key: key);

  final int questionCount;
  final int totalTime;
  final Color iconColor;
  final Color dividerColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        LabelledIcon(
          label: '$questionCount Questions',
          icon: Icon(
            Icons.help,
            color: iconColor,
          ),
        ),
        VerticalDivider(thickness: 3, color: dividerColor),
        LabelledIcon(
          label: '$totalTime secs',
          icon: Icon(
            Icons.timer,
            color: iconColor,
          ),
        ),
        VerticalDivider(thickness: 3, color: dividerColor),
        LabelledIcon(
          label: '${questionCount * 10} Points',
          icon: Icon(
            Icons.emoji_events,
            color: iconColor,
          ),
        ),
      ],
    );
  }
}