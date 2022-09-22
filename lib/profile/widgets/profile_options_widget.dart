import 'package:flutter/material.dart';

class ProfileOptionsWidget extends StatelessWidget {
  const ProfileOptionsWidget({
    Key? key,
    required this.buttonIcon,
    required this.buttonSpecifier,
    this.onPressed,
  }) : super(key: key);
  final String buttonSpecifier;
  final IconData buttonIcon;
  final Function? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        print('ButtonPressed');
        onPressed?.call();
      },
      child: SizedBox(
        width: 130.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.centerRight,
                child: FittedBox(
                  child: Text(
                    buttonSpecifier,
                    style: const TextStyle(
                      color: Color(0xFF717171),
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Container(
              height: 20.0,
              width: 1.5,
              color: const Color(0xFFAEAEAE),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  buttonIcon,
                  size: 23.0,
                  color: const Color(0xFFAEAEAE),
                ),
              ),
            )
          ],
        ),
      ),
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(const Size(125.0, 45.0)),
          backgroundColor: MaterialStateProperty.all(const Color(0xFFF8F7F7)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ))),
    );
  }
}
