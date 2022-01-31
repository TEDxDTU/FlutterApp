import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

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
                child: Image.asset('assets/images/logoWhite.png'),
              ),
              FittedBox(
                fit: BoxFit.contain,
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: mediaQuery.size.height * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
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
          Positioned(
            bottom: 0,
            left: -25,
            child: SvgPicture.asset(
              "assets/images/cup_guy_2.svg",
              width: MediaQuery.of(context).size.width * 0.85,
            ),
          ),
          Positioned(
            bottom: mediaQuery.size.height * 0.2,
            left: mediaQuery.size.height * 0.06,
            child: SizedBox(
              height: mediaQuery.size.height * 0.065,
              width: mediaQuery.size.width * 0.62,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Let's Start",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
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
