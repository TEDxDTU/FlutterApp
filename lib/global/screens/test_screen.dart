import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
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
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width / 1.3,
                // padding: EdgeInsets.all(14),
                child: Image.asset('assets/images/logoWhite.png'),
              ),
              FittedBox(
                fit: BoxFit.contain,
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal:mediaQuery.size.height*0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'x',
                        style: TextStyle(color: Colors.red, fontSize: 24),
                      ),
                      Text(
                        '=independently organized TED event',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              ),
            ],
          ),
          // Positioned(
          //   bottom: 0,
          //   child: Image(
          //     image: svg_provider.Svg(
          //       "assets/cup_guy_2.svg",
          //     ),
          //     // width: MediaQuery.of(context).size.width,
          //     width: 700,
          //     height: 700 + 350,
          //     color: Colors.white,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          Positioned(
            bottom: 0,
            left: -25,
            child: SvgPicture.asset(
              "assets/images/cup_guy_2.svg",
              // color: Colors.white,
              // fit: BoxFit.fitWidth,
              width: MediaQuery.of(context).size.width * 0.85,
              // height: MediaQuery.of(context).size.height * 0.6,
              // width: 400,
              // height: 600,
              //  fit: BoxFit.contain,
              //  height: MediaQuery.of(context).size.height,
              // height: 600,
            ),
          ),
          Positioned(
            bottom: mediaQuery.size.height * 0.2,
            // left: 45,
            left: mediaQuery.size.height * 0.06,
            child: SizedBox(
              height: mediaQuery.size.height * 0.065,
              width: mediaQuery.size.width * 0.62,
              // height: 50,
              // width:230,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Let's Start",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    );
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
