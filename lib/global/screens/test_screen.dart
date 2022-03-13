import 'dart:async';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/events/helpers/concave_corners_with_radius_clip.dart';
import 'package:tedx_dtu_app/events/helpers/dotted_seperator.dart';
import 'package:tedx_dtu_app/events/helpers/filled_arc_painter.dart';
import 'package:tedx_dtu_app/events/widgets/selectable_box.dart';
import 'package:tedx_dtu_app/events/widgets/selectable_box_creator.dart';
import 'package:tedx_dtu_app/sign_up/screens/sign_up_screen.dart';
import 'package:tedx_dtu_app/trivia/models/question.dart';
import 'package:tedx_dtu_app/trivia/models/trivia.dart';
import 'package:tedx_dtu_app/trivia/screens/trivia_screen.dart';
import 'package:tedx_dtu_app/trivia/widgets/circular_spinner.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);
  static const routeName = '/test';

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  late Timer questionTimer;
  int _selectedAns = -1;
  Question question1 = Question(
    question: 'Melody, chocolatey why?',
    options: [
      'It\'s melody, duh',
      'Terse poochi kisi ne?',
      'With due respect, no one asked you to ask this absurdity of a question, good sir.',
    ],
    correctAnswerIndex: 2,
    seconds: 3,
  );

  @override
  void didChangeDependencies() {
    remainingTime = question1.seconds;
    super.didChangeDependencies();
  }

  @override
  void initState() {
    questionTimer =
        Timer.periodic(Duration(seconds: question1.seconds), (timer) {
      setState(() {
        print(remainingTime);
        remainingTime--;
        if (remainingTime == 0) {
          questionTimer.cancel();
        }
      });
    });
    super.initState();
  }

  int remainingTime = 3;

  @override
  Widget build(BuildContext context) {
    final List options = [];
    question1.options.asMap().forEach((index, val) {
      options.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 4,
                color: (_selectedAns == index)
                    ? const Color(0xFFFF7575)
                    : Colors.transparent,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  100,
                ),
              ),
            ),
            width: double.infinity,
            child: SelectableBox(
              shouldMargin: false,
              name: val,
              color: (_selectedAns == index)
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
              onTap: () {
                setState(
                  () {
                    _selectedAns = index;
                  },
                );
              },
            ),
          ),
        ),
      );
    });
    return Scaffold(
      appBar: AppBar(title: Text('Trivia')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Time here
            Text(
              remainingTime.toString(),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            // Question
            AutoSizeText(
              question1.question,
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontSize: 32,
                  ),
            ),

            // Progress
            // Options
            ...options,
            Expanded(child: SizedBox(), flex: 2),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
              onPressed: () {
                // go to next question
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
            Expanded(child: SizedBox(), flex: 1),
          ],
        ),
      ),
    );
  }
}
