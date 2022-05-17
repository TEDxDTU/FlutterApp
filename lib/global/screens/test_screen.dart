import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/events/widgets/ticket_widget.dart';
import 'package:tedx_dtu_app/trivia/screens/trivia_screen.dart';
import 'package:tedx_dtu_app/global/widgets/signup_alertdialog.dart';
import 'package:tedx_dtu_app/trivia/screens/trivia_acknowledge_screen.dart';
import 'package:tedx_dtu_app/trivia/widgets/circular_spinner.dart';
import 'package:tedx_dtu_app/trivia/widgets/rotating_widget.dart';
import 'package:tedx_dtu_app/trivia/widgets/trivia_slider_panel.dart';

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
    return const Scaffold(
      body: SafeArea(child: TriviaAcknowledge()),
    );
  }
}
