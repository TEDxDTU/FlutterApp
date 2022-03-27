import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/trivia/screens/trivia_screen.dart';

import 'package:tedx_dtu_app/trivia/widgets/circular_spinner.dart';
import 'package:tedx_dtu_app/trivia/widgets/rotating_widget.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);
  static const routeName = '/test';

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final _key = GlobalKey<RotatingWidgetState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotatingWidget(
              width: MediaQuery.of(context).size.width - 100,
              key: _key,
              leftChild: Container(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width - 100,
                color: Colors.blue,
              ),
              rightChild: Container(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width - 100,
                color: Colors.red,
              ),
              duration: Duration(milliseconds: 3000),
            ),
            ElevatedButton(
              onPressed: () {
                _key.currentState?.start();
              },
              child: Text("Rotate"),
            )
          ],
        ),
      ),
    );
  }
}
