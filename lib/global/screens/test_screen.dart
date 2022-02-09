import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
          clipper: MyCustomClip(),
          child: Container(width: 350, height: 200, color: Colors.white),
        ),
      ),
    );
  }
}

class MyCustomClip extends CustomClipper<Path> {
  var clipRadius = 18.0;

  bool topLeft = true;
  bool topRight = true;
  bool bottomLeft = true;
  bool bottomRight = true;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - clipRadius);
    path.quadraticBezierTo(size.width - clipRadius, size.height - clipRadius,
        size.width - clipRadius, size.height);
    path.moveTo(0, 0);
    path.lineTo(0, size.height - clipRadius);
    path.quadraticBezierTo(
        clipRadius, size.height - clipRadius, clipRadius, size.height);
    path.lineTo(size.width - clipRadius, size.height);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
