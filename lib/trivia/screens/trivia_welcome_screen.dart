import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/global/screens/future_screen_template.dart';
import 'package:tedx_dtu_app/global/screens/refreshable_future_screen_template.dart';
import 'package:tedx_dtu_app/home/screens/no_bottombar_screen.dart';
import 'package:tedx_dtu_app/trivia/screens/trivia_attempt_screen.dart';
import 'package:tedx_dtu_app/trivia/screens/trivia_countdown_screen.dart';
import 'package:tedx_dtu_app/trivia/screens/trivia_acknowledge_screen.dart';
import '../models/trivia.dart';
import '../providers/trivia_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool checkbox = false;
//TODO: 1. Add Timer widget just before starting trivia     DONE
//      2. Add error handling in this screen
//      3. Add trivia time taken count                      DONE
//      4. Change default value of points to 10             DONE

// class TriviaWelcomeScreen extends StatelessWidget {
//   const TriviaWelcomeScreen({Key? key}) : super(key: key);
//   static const routeName = '/trivia-welcome-screen';
//
//   _loadCounter() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       checkbox = (prefs.getBool('check') ?? false);
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     final routeArgs =
//         ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
//     final id = routeArgs['id'].toString();
//     TriviaProvider triviaProvider =
//         Provider.of<TriviaProvider>(context, listen: false);
//     return FutureBuilder(
//       future: triviaProvider.fetchTriviaQuestions(id),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Scaffold(
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         }
//         Trivia trivia = triviaProvider.findById(id);
//         if (trivia.hasAttempted == true) {
//           return const Scaffold(
//             body: Center(
//               child: Text(
//                 'Trivia has already been attempted',
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           );
//         }
//         if (checkbox == true) {
//           return const Scaffold(
//             body: TriviaCountdownScreen(),
//           );
//         }
//         return Scaffold(
//           body: TriviaAcknowledge(
//             onPressed: () {
//               Navigator.of(context).pushReplacementNamed(
//                   NoBottomBarScreen.routeName,
//                   arguments: {
//                     'child': const TriviaCountdownScreen(),
//                     'trivia': trivia,
//                   });
//             },
//           ),
//         );
//       },
//     );
//   }
// }

class TriviaWelcomeScreen extends StatefulWidget {
  const TriviaWelcomeScreen({Key? key}) : super(key: key);
  static const routeName = '/trivia-welcome-screen';
  @override
  State<TriviaWelcomeScreen> createState() => _TriviaWelcomeScreenState();
}

class _TriviaWelcomeScreenState extends State<TriviaWelcomeScreen> {
  @override
  void initState() {
    super.initState();
    _loadCheck();
  }

  void _loadCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      checkbox = (prefs.getBool('checkbox') ?? false);
    });
  }

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
        if (checkbox == true) {
          return Scaffold(
            body: TriviaCountdownScreen(
              triviaStr: trivia,
            ),
          );
        }
        return Scaffold(
          body: TriviaAcknowledge(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(
                  NoBottomBarScreen.routeName,
                  arguments: {
                    'child': TriviaCountdownScreen(
                      triviaStr: trivia,
                    ),
                    'trivia': trivia,
                  });
            },
          ),
        );
      },
    );
  }
}
