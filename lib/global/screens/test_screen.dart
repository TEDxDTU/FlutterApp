import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/events/screens/speaker_details_screen.dart';
import 'package:tedx_dtu_app/events/widgets/ticket_widget.dart';
import 'package:tedx_dtu_app/global/widgets/youtube_embed_widget.dart';
import 'package:tedx_dtu_app/trivia/models/trivia.dart';
import 'package:tedx_dtu_app/trivia/screens/trivia_screen.dart';

import 'package:tedx_dtu_app/trivia/widgets/circular_spinner.dart';
import 'package:tedx_dtu_app/trivia/widgets/rotating_widget.dart';

import '../providers/config.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);
  static const routeName = '/test';

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final _key = GlobalKey<RotatingWidgetState>();

  static const url = 'https://www.youtube.com/watch?v=sam89lVM2RE';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: Center(child: YoutubeEmbedWidget(url: url)),
        body: Center(
            child: YoutubeEmbedWidget(
      url: url,
    )));
  }
}
