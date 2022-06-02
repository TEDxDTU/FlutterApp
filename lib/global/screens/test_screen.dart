import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/events/widgets/ticket_widget.dart';
import 'package:tedx_dtu_app/events/screens/intro_screen.dart';
import 'package:tedx_dtu_app/helpers/classes/ui_helper.dart';
import 'package:tedx_dtu_app/trivia/screens/trivia_screen.dart';
import 'package:tedx_dtu_app/global/widgets/signup_alertdialog.dart';
import 'package:tedx_dtu_app/trivia/screens/trivia_acknowledge_screen.dart';
import 'package:tedx_dtu_app/trivia/widgets/circular_spinner.dart';
import 'package:tedx_dtu_app/sign_up/screens/sign_in_screen.dart';
import 'package:tedx_dtu_app/recent_updates/models/recent_update.dart';
import 'package:tedx_dtu_app/recent_updates/screens/recent_updates_screen.dart';
import 'package:tedx_dtu_app/trivia/widgets/rotating_widget.dart';
import 'package:tedx_dtu_app/trivia/widgets/trivia_slider_panel.dart';
import '../widgets/youtube_embed_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);
  static const routeName = '/test';
  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final _key = GlobalKey<RotatingWidgetState>();

  static const url = 'https://www.youtube.com/watch?v=sam89lVM2RE';
  // void initState() {
  //   super.initState();
  //   _loadCheckBoxValue();
  // }
  //
  // _loadCheckBoxValue() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     checkbox = (prefs.getBool('checkbox') ?? false);
  //   });
  // }
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  UIHelper.showSpinnerDialog(context);
                  await Future.delayed(const Duration(seconds: 3));
                  UIHelper.removeSpinnerDialog(context);
                },
                child: const Text("Press"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
