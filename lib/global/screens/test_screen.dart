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
    return Scaffold();
  }
}
