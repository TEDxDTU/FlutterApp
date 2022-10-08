import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/global/providers/auth.dart';

class SignUpAlertDialog extends StatelessWidget {
  SignUpAlertDialog({Key? key,required this.description}) : super(key: key);
  String description;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.fromLTRB(25, 25, 0, 0),
      content: SizedBox(
        height: 200.0,
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          description,
                          style:const TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                        onPressed: () {
                          print('SignIn button Pressed');
                          Navigator.of(context).pop();
                          Provider.of<Auth>(context, listen: false)
                              .signOut(context);
                        },
                        child: const Text(
                          'SignIn',
                          style: TextStyle(color: Colors.white, fontSize: 14.0),
                        ),
                        style: ButtonStyle(
                          minimumSize:
                              MaterialStateProperty.all(const Size(100, 35)),
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
                  flex: 4,
                  child: SizedBox(width: 1),
                ),
              ],
            ),
            Positioned(
              right: 0,
              bottom: -26,
              child: SvgPicture.asset(
                'assets/images/guy_with_laptop.svg',
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
