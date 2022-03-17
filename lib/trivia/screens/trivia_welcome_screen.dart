import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/global/screens/future_screen_template.dart';
import 'package:tedx_dtu_app/global/screens/refreshable_future_screen_template.dart';
import 'package:tedx_dtu_app/home/screens/no_bottombar_screen.dart';
import 'package:tedx_dtu_app/trivia/screens/trivia_attempt_screen.dart';
import 'package:tedx_dtu_app/trivia/screens/trivia_countdown_screen.dart';

import '../models/trivia.dart';
import '../providers/trivia_provider.dart';

//TODO: 1. Add Timer widget just before starting trivia     DONE
//      2. Add error handling in this screen
//      3. Add trivia time taken count                      DONE
//      4. Change default value of points to 10             DONE

class TriviaWelcomeScreen extends StatelessWidget {
  const TriviaWelcomeScreen({Key? key}) : super(key: key);
  static const routeName = '/trivia-welcome-screen';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final id = routeArgs['id'].toString();
    TriviaProvider triviaProvider =
        Provider.of<TriviaProvider>(context, listen: false);
    return FutureBuilder(
      future: triviaProvider.fetchTriviaQuestions(id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        Trivia trivia = triviaProvider.findById(id);
        if (trivia.hasAttempted == true) {
          return const Scaffold(
            body: Center(
              child: Text(
                'Trivia has already been attempted',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          );
        }
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Rules!',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(
                        NoBottomBarScreen.routeName,
                        arguments: {
                          'child': const TriviaCountdownScreen(),
                          'trivia': trivia,
                        });
                  },
                  child: const Text(
                    'Acknowledge',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
