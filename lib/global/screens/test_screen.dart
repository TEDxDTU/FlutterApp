import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/events/helpers/concave_corners_with_radius_clip.dart';
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
    String venue = 'Coliz me';
    DateTime dateTime = DateTime.now();

    return Scaffold(
      body: Center(
        child: ClipPath(
          clipper: const ConcaveCornersWithRadiusClip(),
          child: Container(width: 350, height: 200, color: Colors.white),
        ),
      ),
    );
  }
}
