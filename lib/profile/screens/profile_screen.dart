import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/global/screens/test_screen.dart';
import 'package:tedx_dtu_app/global/widgets/bottom_bar_screen_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomBarScreenWidget(
      children: [
        Container(
          height: 100,
          width: 300,
          color: Colors.white,
        ),
        Text('Profile'),
        Container(
          height: 100,
          width: 300,
          color: Colors.red,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
              TestScreen.routeName,
              arguments: 'Profile',
            );
          },
          child: Text('PUSH TO TEXT'),
        )
      ],
    );
  }
}
