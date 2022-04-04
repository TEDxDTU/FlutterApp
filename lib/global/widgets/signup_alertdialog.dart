import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpAlertDialog extends StatelessWidget {
  const SignUpAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
      content: SizedBox(
        height: 200.0,
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Container(
                        child: const Text(
                          'To attend the live event, you need to sign up first.',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          print('SignUp button Pressed');
                        },
                        child: const Text(
                          'SignUp',
                          style: TextStyle(color: Colors.white, fontSize: 14.0),
                        ),
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(100, 35)),
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).primaryColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  flex: 3,
                  child: SizedBox(width: 1),
                ),
              ],
            ),
            Positioned(
              right: 0,
              bottom: -25,
              child: SvgPicture.asset(
                'assests/guy_with_laptop.svg',
              ),
            )
          ],
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(40.0)),
      ),
      backgroundColor: Colors.white,
    );
  }
}
