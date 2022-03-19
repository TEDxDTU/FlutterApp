import 'package:flutter/material.dart';

import 'package:tedx_dtu_app/trivia/widgets/circular_spinner.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);
  static const routeName = '/test';

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          // child: CircularSpinner(onComplete: () {
          //   print('le, ho gaya complete');
          // }),
          ),
    );
  }
}
