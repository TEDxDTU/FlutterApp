import 'package:flutter/material.dart';

class AccountCircleWithText extends StatelessWidget {
  const AccountCircleWithText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.account_circle,
              color: Colors.black,
              size: 28,
            ),
            SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ],
        ),
        Divider(
          color: Colors.grey,
          thickness: 0.7,
        ),
      ],
    );
  }
}
