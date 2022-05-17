import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tedx_dtu_app/helpers/extensions/padding_widget_list_extension.dart';
import 'package:tedx_dtu_app/trivia/widgets/circular_dots_row.dart';

class TriviaAcknowledge extends StatefulWidget {
  const TriviaAcknowledge({Key? key}) : super(key: key);

  @override
  State<TriviaAcknowledge> createState() => _TriviaAcknowledgeState();
}

class _TriviaAcknowledgeState extends State<TriviaAcknowledge> {
  int _currentIndex = 0;
  bool check_index =
      false; // for hiding circular dot row and showing accept button
  bool checkbox =
      false; // checkbox var for don't show again, use this bool var for shared preferences
  CarouselController carouselController = CarouselController();
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
              ConditionWidget(
                check: checkbox,
                accept_button: check_index,
                icon: Icons.wifi_tethering,
                currentIndex: _currentIndex,
                term: "Maintain Good Internet Connection",
                termDetailed:
                    "Maintain a good internet connection in order to play seamlessly",
                image: Image.asset("assets/images/boy_with_laptop_trivia.png"),
              ),
              ConditionWidget(
                check: checkbox,
                accept_button: check_index,
                icon: Icons.exit_to_app_rounded,
                currentIndex: _currentIndex,
                term: "Don't Switch to other apps.",
                termDetailed:
                    "Switching to other apps may lead to over quiz instantly",
                image: Image.asset("assets/images/boy_with_phone.png"),
              ),
              ConditionWidget(
                check: checkbox,
                accept_button: check_index,
                icon: Icons.watch_later_outlined,
                currentIndex: _currentIndex,
                term: "Keep an eye on Clock",
                termDetailed:
                    "The trivia is timed so make sure to answer within the time limit!",
                image: Image.asset("assets/images/boy_is_holding_clock.png"),
              ),
            ].padded(padding: const EdgeInsets.fromLTRB(10, 10, 10, 0)),
            options: CarouselOptions(
              initialPage: _currentIndex,
              pageSnapping: true,
              height: queryData.size.height * 0.8,
              enableInfiniteScroll: false,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                  if (index == 2) {
                    check_index = true;
                  } else if (index < 2) {
                    check_index = false;
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ConditionWidget extends StatefulWidget {
  ConditionWidget(
      {Key? key,
      required this.check,
      required this.accept_button,
      required this.currentIndex,
      required this.icon,
      required this.image,
      required this.term,
      required this.termDetailed})
      : super(key: key);
  final String term;
  final String termDetailed;
  final IconData icon;
  final Image image;

  bool accept_button;
  bool check; // for checkbox
  int currentIndex;
  @override
  State<ConditionWidget> createState() => _ConditionWidgetState();
}

class _ConditionWidgetState extends State<ConditionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    widget.icon,
                    size: 40.0,
                  ),
                  const SizedBox(
                    width: 3.0,
                  ),
                  Expanded(
                    child: Text(
                      widget.term,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(flex: 2, child: widget.image),
          Expanded(
            flex: 2,
            child: ClipPath(
              clipper: CustomClipper1(),
              child: Container(
                color: const Color(0xffD2D2D2),
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(30, 90, 30, 0),
                      child: Text(
                        widget.termDetailed,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: !widget.accept_button,
                      child: Positioned(
                        left: 50,
                        right: 50,
                        top: 200,
                        child: SizedBox(
                          // width: double.infinity,
                          child: CircularDotsRow(
                            currentIndex: widget.currentIndex,
                            maxIndex: 3,
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: widget.accept_button,
                      child: Positioned(
                        left: 50,
                        right: 50,
                        top: 140,
                        child: Column(
                          children: [
                            TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                padding: MaterialStateProperty.resolveWith<
                                    EdgeInsetsGeometry>(
                                  (Set<MaterialState> states) {
                                    return const EdgeInsets.fromLTRB(
                                        15, 8, 15, 8);
                                  },
                                ),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50))),
                                backgroundColor: MaterialStateProperty.all(
                                    Theme.of(context).primaryColor),
                              ),
                              child: const Text(
                                "Accept",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Checkbox(
                                    value: widget.check,
                                    fillColor: MaterialStateProperty.all(
                                        Theme.of(context).primaryColor),
                                    hoverColor: Colors.redAccent,
                                    onChanged: (value) {
                                      setState(() {
                                        widget.check = value!;
                                      });
                                    }),
                                const Text(
                                  "Don't show again",
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var controlPoint = Offset(size.width / 2, size.height / 2);
    var endPoint = const Offset(0, 0);
    double radius = 15;
    Path path = Path();
    path.lineTo(0, size.height - radius);
    path.quadraticBezierTo(0, size.height, 15, size.height);
    path.lineTo(size.width - radius, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - radius);
    path.lineTo(size.width, 0);
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
