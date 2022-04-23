import 'package:flutter/material.dart';

import 'package:tedx_dtu_app/trivia/widgets/rotating_widget.dart';

import '../widgets/youtube_embed_widget.dart';

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
      body: Center(child: YoutubeEmbedWidget(url: url)),
      // body: Center(
      //   child: YoutubeEmbedWidget(
      //     url: url,
      //   ),
      // ),
    );
  }
}
