import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/global/screens/refreshable_future_screen_template.dart';
import 'package:tedx_dtu_app/home/screens/no_bottombar_screen.dart';
import 'package:tedx_dtu_app/trivia/screens/trivia_attempt_screen.dart';

import '../models/trivia.dart';
import '../providers/trivia_provider.dart';

class TriviaWelcomeScreen extends StatelessWidget {
  const TriviaWelcomeScreen({Key? key}) : super(key: key);
  static const routeName = '/trivia-welcome-screen';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final id = routeArgs['id'].toString();
    Trivia trivia =
        Provider.of<TriviaProvider>(context, listen: false).findById(id);
    return Center(
        child: Column(
      children: [
        Text('Rules!'),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .pushNamed(NoBottomBarScreen.routeName, arguments: {
              'child': const TriviaAttemptScreen(),
              'trivia': trivia,
            });
          },
          child: Text('Acknowledge'),
        ),
      ],
    ));
  }
}
