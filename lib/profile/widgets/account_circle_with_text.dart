import 'package:flutter/material.dart';

/// Utility widget that displays text next to an [Icons.account_circle] icon,
/// and a divider below both these items.
class AccountCircleWithText extends StatelessWidget {
  const AccountCircleWithText({
    Key? key,
    required this.text,
  }) : super(key: key);

  /// The text to show next to the [Icons.account_circle] icon.
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(
              Icons.account_circle,
              color: Colors.black,
              size: 28,
            ),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ],
        ),
        const Divider(
          color: Colors.grey,
          thickness: 0.7,
        ),
      ],
    );
  }
}
