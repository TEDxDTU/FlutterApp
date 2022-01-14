import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/global/widgets/tedx_loading_spinner.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);
  static const routeName = '/test';

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  bool showSpinner = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            showSpinner ? TedxLoadingSpinner() : Text('NO SPINNER'),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    showSpinner = false;
                  });
                },
                child: Text('HIDE')),
          ],
        ),
      ),
    );
  }
}
