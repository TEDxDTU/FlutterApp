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
  var tedxLoadingSpinnerKey = GlobalKey<TedxLoadingSpinnerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test')),
      body: Center(
        child: FutureBuilder(
            future: Future.delayed(Duration(seconds: 3)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                print('waiting');
                return TedxLoadingSpinner(key: tedxLoadingSpinnerKey);
              }
              if (snapshot.connectionState == ConnectionState.done) {
                return FutureBuilder(
                    future: tedxLoadingSpinnerKey.currentState
                        ?.translate(MediaQuery.of(context).size.width.toInt()),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return TedxLoadingSpinner(key: tedxLoadingSpinnerKey);
                      }
                      return Text('No loading spinner');
                    });
              }
              return Text('Error');
            }),
      ),
    );
  }
}
