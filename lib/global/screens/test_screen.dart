import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/recent_updates/models/recent_update.dart';
import 'package:tedx_dtu_app/recent_updates/screens/recent_updates_screen.dart';

import 'package:tedx_dtu_app/trivia/widgets/rotating_widget.dart';

import '../../helpers/constants/constants.dart';
import '../widgets/youtube_embed_widget.dart';
import 'package:http/http.dart' as http;

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);
  static const routeName = '/test';

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final _key = GlobalKey<RotatingWidgetState>();

  // static const url = 'https://www.youtube.com/watch?v=sam89lVM2RE';
  Future<void> sendReq() async {
    final userToken = await FirebaseAuth.instance.currentUser!.getIdToken();
    final url = "$nodeServerBaseUrl/api/user/tickets";
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': userToken,
      },
    );
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        child: YoutubeEmbedWidget(),
      )),
    );
  }
}
