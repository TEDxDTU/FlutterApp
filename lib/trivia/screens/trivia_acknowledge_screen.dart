import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tedx_dtu_app/helpers/extensions/padding_widget_list_extension.dart';
import 'package:tedx_dtu_app/trivia/widgets/circular_dots_row.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tedx_dtu_app/trivia/widgets/trivia_acknowledge_condition_widget.dart';

class TriviaAcknowledge extends StatefulWidget {
  TriviaAcknowledge({Key? key, required this.onPressed}) : super(key: key);
  VoidCallback onPressed;
  @override
  State<TriviaAcknowledge> createState() => _TriviaAcknowledgeState();
}

class _TriviaAcknowledgeState extends State<TriviaAcknowledge> {
  int _currentIndex = 0;
  bool checkbox = false;

  CarouselController carouselController = CarouselController();
  @override
  void initState() {
    super.initState();
    _loadCheckBoxValue();
  }

  void _loadCheckBoxValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      checkbox = (prefs.getBool('checkbox') ?? false);
    });
  }

  void _saveCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('checkbox', checkbox);
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
      child: Column(
        children: [
          CarouselSlider(
            carouselController: carouselController,
            items: [
              TriviaAcknowledgeConditions(
                child: SizedBox(
                  child: CircularDotsRow(
                    currentIndex: _currentIndex,
                    maxIndex: 3,
                  ),
                ),
                icon: Icons.wifi_tethering,
                term: "Maintain Good Internet Connection",
                termDetailed:
                    "Maintain a good internet connection in order to play seamlessly",
                image: Image.asset("assets/images/boy_with_laptop_trivia.png"),
              ),
              TriviaAcknowledgeConditions(
                child: SizedBox(
                  child: CircularDotsRow(
                    currentIndex: _currentIndex,
                    maxIndex: 3,
                  ),
                ),
                icon: Icons.exit_to_app_rounded,
                term: "Don't Switch to other apps.",
                termDetailed:
                    "Switching to other apps may lead to over quiz instantly",
                image: Image.asset("assets/images/boy_with_phone.png"),
              ),
              TriviaAcknowledgeConditions(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 35,
                      child: TextButton(
                        onPressed: () {
                          _saveCheck();
                          widget.onPressed();
                        },
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          padding: MaterialStateProperty.resolveWith<
                              EdgeInsetsGeometry>(
                            (Set<MaterialState> states) {
                              return const EdgeInsets.fromLTRB(15, 5, 15, 5);
                            },
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50))),
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).primaryColor),
                        ),
                        child: const Text(
                          "Accept",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 15,
                            width: 30,
                            child: Checkbox(
                                value: checkbox,
                                fillColor: MaterialStateProperty.all(
                                    Theme.of(context).primaryColor),
                                hoverColor: Colors.redAccent,
                                onChanged: (value) {
                                  setState(() {
                                    checkbox = value!;
                                  });
                                }),
                          ),
                          const Text(
                            "Don't show again",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                icon: Icons.watch_later_outlined,
                term: "Keep an eye on Clock",
                termDetailed:
                    "The trivia is timed so make sure to answer within the time limit!",
                image: Image.asset("assets/images/boy_is_holding_clock.png"),
              ),
            ].padded(padding: const EdgeInsets.fromLTRB(10, 20, 10, 0)),
            options: CarouselOptions(
              initialPage: _currentIndex,
              pageSnapping: true,
              height: queryData.size.height * 0.75,
              enableInfiniteScroll: false,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
