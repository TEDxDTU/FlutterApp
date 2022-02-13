import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/events/helpers/concave_corners_with_radius_clip.dart';
import 'package:tedx_dtu_app/events/helpers/dotted_seperator.dart';
import 'package:tedx_dtu_app/events/helpers/filled_arc_painter.dart';

class TestScreen extends StatelessWidget {
  TestScreen({Key? key}) : super(key: key);
  static const routeName = '/test';

  final Random random = Random();
  @override
  Widget build(BuildContext context) {
    // var routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    // String eventDesc = routeArgs['eventDescription'].toString();
    // String venue = routeArgs['venue'].toString();
    // DateTime dateTime = routeArgs['dateTime'] as DateTime;
    String eventTitle = 'Design for Innovation';
    String eventDesc = 'Ted Talks with Dr. Sushmita Rai';
    String venue = 'Coliz me\n110039';
    DateTime dateTime = DateTime.now();
    int eventPrice = 180;

    var mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        // TODO: Add style
        title: const Text("Almost There!"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  ClipPath(
                    clipper: const ConcaveCornersWithRadiusClip(
                      bottomRight: true,
                      bottomLeft: true,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(18),
                      width: mediaQuery.size.width * 0.9,
                      height: mediaQuery.size.height * 0.25,
                      color: const Color(0xff303030),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: mediaQuery.size.width * 0.9 * 0.5,
                            child: AutoSizeText(
                              eventDesc,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                              maxLines: 2,
                            ),
                          ),
                          SizedBox(height: mediaQuery.size.height * 0.05),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: mediaQuery.size.width * 0.9 * 0.4,
                                child: AutoSizeText(
                                  eventTitle,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  maxLines: 2,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: const [
                                      Text(
                                        '1st Feb, 2022',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Icon(
                                        Icons.calendar_today_outlined,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: const [
                                      Text(
                                        '13:00 hours onwards',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Icon(
                                        Icons.access_time_outlined,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: CustomPaint(
                      painter: FilledArcPainter(),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 20,
                    child: SizedBox(
                      width: 110,
                      child: Image.asset(
                        'assets/images/logoWhite.png',
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  ClipPath(
                    clipper: const ConcaveCornersWithRadiusClip(
                      topRight: true,
                      topLeft: true,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      width: mediaQuery.size.width * 0.9,
                      height: mediaQuery.size.height * 0.45,
                      color: const Color(0xff303030),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  venue,
                                  maxLines: 3,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontSize: 12,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    child: SizedBox(
                      width: mediaQuery.size.width * 0.9 - 24,
                      child: const DottedSeparator(),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(mediaQuery.size.width * 0.9 * 0.9, 40),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                      ),
                      child: Text(
                        "Pay $eventPrice",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
