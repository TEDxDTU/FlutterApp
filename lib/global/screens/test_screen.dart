import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tedx_dtu_app/events/widgets/event_info.dart';
import 'package:tedx_dtu_app/events/widgets/single_event_widget.dart';
import 'package:tedx_dtu_app/global/widgets/tedx_loading_spinner.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg_provider;

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);
  static const routeName = '/test';

  // bool showSpinner = true;
  // String? title;
  // late DateTime eventTime;
  // var tedxLoadingSpinnerKey = GlobalKey<TedxLoadingSpinnerState>();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold();
  }
}

/*
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
      */

/*Expanded(
                child: Container(
                  width: double.infinity,
                  child: SvgPicture.asset(
                    "assets/images/cup guy 2.svg",
                    color: Colors.white,
                    fit: BoxFit.fitWidth,

                    //  fit: BoxFit.contain,
                    //  height: MediaQuery.of(context).size.height,
                    // height: 600,
                  ),
                ),
              ),
*/
