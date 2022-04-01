import 'package:flutter/material.dart';

import '../models/question.dart';
import '../widgets/circular_dots_row.dart';
import '../widgets/trivia_question_options.dart';

/// Displays a trivia question on the screen.
class TriviaQuestionScreen extends StatelessWidget {
  const TriviaQuestionScreen({
    Key? key,
    required this.title,
    required this.question,
    required this.setSelectedOption,
    required this.currentQuestionIndex,
    required this.questionCount,
    required this.goToNextQuestion,
    required this.incrementTimeTaken,
    required this.isTop,
  }) : super(key: key);

  /// Title of the trivia.
  final String title;

  /// The question to be displayed.
  final Question question;

  /// The index of this question, used in the [CircularDotsRow] progress indicator.
  final int currentQuestionIndex;

  /// Total question count of this trivia, used in [CircularDotsRow] progress indicator
  final int questionCount;

  /// Function that runs when the user selects an option.
  final void Function(int) setSelectedOption;

  /// Function that runs when the user clicks "Proceed" button, or when the time
  /// runs out on a question.
  final Future<void> Function() goToNextQuestion;

  /// Increments the time taken by user on this question periodically.
  final void Function() incrementTimeTaken;

  /// A boolean which specifies if this [TriviaQuestionScreen] is on top, i.e.
  /// is it the current question, or is it the bottom one (in the stack, used
  /// for the 3D transition). If it is on top, then we run the timer and
  /// increment the user's time taken. Otherwise we do not.
  final bool isTop;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          // Question and options
          Expanded(
            child: TriviaQuestionOptions(
              question,
              setSelectedOption,
              CircularDotsRow(
                currentIndex: currentQuestionIndex,
                maxIndex: questionCount,
                mode: CircularDotMode.previousSelected,
              ),
              goToNextQuestion,
              incrementTimeTaken,
              isTop,
              key: key,
            ),
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
              goToNextQuestion();
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
    );
  }
}
