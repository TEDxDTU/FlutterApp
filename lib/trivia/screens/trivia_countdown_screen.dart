import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/trivia/screens/trivia_attempt_screen.dart';
import 'package:tedx_dtu_app/trivia/widgets/circular_spinner.dart';
import '../../home/screens/no_bottombar_screen.dart';
import '../models/trivia.dart';
import '../providers/trivia_provider.dart';

class TriviaCountdownScreen extends StatelessWidget {
  TriviaCountdownScreen({Key? key, required this.triviaStr}) : super(key: key);
  Trivia? triviaStr;
  static const routeName = '/trivia-countdown-screen';
  @override
  Widget build(BuildContext context) {
    // var routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final Trivia trivia = triviaStr!; //routeArgs['trivia'] as Trivia;
    return Scaffold(body: Center(
      child: CircularSpinner(
        onComplete: () async {
          await Provider.of<TriviaProvider>(
            context,
            listen: false,
          ).markTriviaStarted(trivia.id);
          Navigator.of(context)
              .pushReplacementNamed(NoBottomBarScreen.routeName, arguments: {
            'child': const TriviaAttemptScreen(),
            'trivia': trivia,
          });
        },
      ),
    ));
  }
}
