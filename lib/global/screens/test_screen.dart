import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/events/helpers/concave_corners_with_radius_clip.dart';
import 'package:tedx_dtu_app/events/helpers/dotted_seperator.dart';
import 'package:tedx_dtu_app/events/widgets/event_info_widget.dart';

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
    String eventDesc = 'Event Description';
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
              ClipPath(
                clipper: const ConcaveCornersWithRadiusClip(
                  bottomRight: true,
                  bottomLeft: true,
                ),
                child: Container(
                  width: mediaQuery.size.width * 0.9,
                  height: mediaQuery.size.height * 0.25,
                  color: const Color(0xff303030),
                ),
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
