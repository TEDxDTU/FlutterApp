import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/events/widgets/ticket_widget.dart';
import 'package:tedx_dtu_app/global/providers/test_provider.dart';
import 'package:tedx_dtu_app/global/screens/future_screen_template.dart';
import 'package:tedx_dtu_app/events/screens/intro_screen.dart';
import 'package:tedx_dtu_app/global/widgets/bottom_bar_screen_widget.dart';
import 'package:tedx_dtu_app/helpers/classes/ui_helper.dart';
import 'package:tedx_dtu_app/home/providers/story_event_provider.dart';
import 'package:tedx_dtu_app/trivia/screens/trivia_screen.dart';
import 'package:tedx_dtu_app/global/widgets/signup_alertdialog.dart';
import 'package:tedx_dtu_app/trivia/screens/trivia_acknowledge_screen.dart';
import 'package:tedx_dtu_app/trivia/widgets/circular_spinner.dart';
import 'package:tedx_dtu_app/sign_up/screens/sign_in_screen.dart';
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
    return FutureScreenTemplate(
      future: Provider.of<StoryEventProvider>(context, listen: false)
          .fetchData()
          ?.call(),
      body: BottomBarScreenWidget(
        children: [
          Text(Provider.of<StoryEventProvider>(context).data[0].title),
        ],
      ),
    );
  }
}
