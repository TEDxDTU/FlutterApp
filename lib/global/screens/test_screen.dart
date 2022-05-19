import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/events/widgets/ticket_widget.dart';
import 'package:tedx_dtu_app/global/providers/test_provider.dart';
import 'package:tedx_dtu_app/global/screens/future_screen_template.dart';
import 'package:tedx_dtu_app/trivia/screens/trivia_screen.dart';
import 'package:tedx_dtu_app/global/widgets/signup_alertdialog.dart';
import 'package:tedx_dtu_app/trivia/screens/trivia_acknowledge_screen.dart';
import 'package:tedx_dtu_app/trivia/widgets/circular_spinner.dart';

import 'package:tedx_dtu_app/recent_updates/models/recent_update.dart';
import 'package:tedx_dtu_app/recent_updates/screens/recent_updates_screen.dart';

import 'package:tedx_dtu_app/trivia/widgets/rotating_widget.dart';
import 'package:tedx_dtu_app/trivia/widgets/trivia_slider_panel.dart';

import '../widgets/youtube_embed_widget.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);
  static const routeName = '/test';

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test screen"),
      ),
      body: FutureScreenTemplate(
        future: Provider.of<TestProvider>(context, listen: false)
            .fetchData(true)
            ?.call(),
        body: Center(
          child: Text(
            'Everything is well and good!',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
