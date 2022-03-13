import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/global/screens/future_screen_template.dart';
import 'package:tedx_dtu_app/trivia/models/trivia.dart';
import 'package:tedx_dtu_app/trivia/providers/trivia_provider.dart';
import 'package:tedx_dtu_app/trivia/widgets/trivia_question_options.dart';

import '../models/question.dart';

class TriviaAttemptScreen extends StatefulWidget {
  const TriviaAttemptScreen({Key? key}) : super(key: key);
  static const routeName = '/trivia-attempt-screen';

  @override
  State<TriviaAttemptScreen> createState() => _TriviaAttemptScreenState();
}

class _TriviaAttemptScreenState extends State<TriviaAttemptScreen> {
  @override
  int _currentQuestion = 0;
  Widget build(BuildContext context) {
    print(ModalRoute.of(context)!.settings.arguments);
    var routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    print('routeargs: $routeArgs');
    Trivia trivia = routeArgs['trivia'] as Trivia;

    var appBar = AppBar(title: const Text('Trivia'));

    return Scaffold(
      appBar: appBar,
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            // Question and options
            Expanded(
              child: TriviaQuestionOptions(trivia.questions![_currentQuestion]),
            ),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
              onPressed: () {
                setState(() {
                  _currentQuestion++;
                });
              },
              child: SizedBox(
                width: 80,
                child: Row(
                  children: const [
                    Text('Proceed'),
                    Icon(
                      Icons.arrow_forward_rounded,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
