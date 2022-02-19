import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/events/helpers/concave_corners_with_radius_clip.dart';
import 'package:tedx_dtu_app/events/helpers/dotted_seperator.dart';
import 'package:tedx_dtu_app/events/helpers/filled_arc_painter.dart';
import 'package:tedx_dtu_app/events/widgets/selectable_box.dart';
import 'package:tedx_dtu_app/events/widgets/selectable_box_creator.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);
  static const routeName = '/test';

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  void didChangeDependencies() {
    for (int i = 1; i <= 8; i++) {
      precacheImage(AssetImage('assets/event_booking/$i.png'), context);
    }
    super.didChangeDependencies();
  }

  var numberOfTickets = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
