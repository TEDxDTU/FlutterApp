import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/events/screens/speaker_details_screen.dart';
import 'package:tedx_dtu_app/events/widgets/ticket_widget.dart';
import 'package:tedx_dtu_app/recent_updates/screens/recent_updates_screen.dart';
import 'package:tedx_dtu_app/trivia/models/trivia.dart';
import 'package:tedx_dtu_app/trivia/screens/trivia_screen.dart';

import 'package:tedx_dtu_app/trivia/widgets/circular_spinner.dart';
import 'package:tedx_dtu_app/trivia/widgets/rotating_widget.dart';
import 'package:tedx_dtu_app/home/screens/no_bottombar_screen.dart';
import 'package:tedx_dtu_app/recent_updates/screens/webview_screen.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);
  static const routeName = '/test';

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final _key = GlobalKey<RotatingWidgetState>();
  @override
  Widget build(BuildContext context) {
    return RecentUpdatesScreen();
  }
}
