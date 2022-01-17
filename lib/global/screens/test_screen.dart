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
  String? title;

  @override
  void didChangeDependencies() {
    title = ModalRoute.of(context)?.settings.arguments as String?;
    super.didChangeDependencies();
  }

  var tedxLoadingSpinnerKey = GlobalKey<TedxLoadingSpinnerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title ?? 'TEST')),
      body: Center(
        child: FutureBuilder(
            // In future, a future call is to be passed, and must be chained
            // with the awaited translate method present in [TedxLoadingSpinner]
            // for the x in TEDx to fly out of the screen.
            // For just the TEDx logo with x spinning and then disappearing, use
            // this widget like you would use [CircularProgressIndicator].
            future:
                Future.delayed(const Duration(seconds: 5)).then((value) async {
              await tedxLoadingSpinnerKey.currentState!.translate();
              return value;
            }),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return TedxLoadingSpinner(key: tedxLoadingSpinnerKey);
              }
              return const Text('Hey! Sorry for the delay.');
            }),
      ),
    );
  }
}
