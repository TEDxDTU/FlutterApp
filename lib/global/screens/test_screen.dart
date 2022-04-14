import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/home/screens/no_bottombar_screen.dart';
import 'package:tedx_dtu_app/recent_updates/screens/webview_screen.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);
  static const routeName = '/test';

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
      child: Text('Click me!'),
      onPressed: () {
        Navigator.of(context)
            .pushNamed(NoBottomBarScreen.routeName, arguments: {
          'child': WebsiteView(),
          'url': 'https://www.ted.com',
        });
      },
    ));
  }
}
