import 'package:flutter/material.dart';

import '../models/question.dart';
import '../widgets/circular_dots_row.dart';
import '../widgets/trivia_question_options.dart';

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
  final String title;
  final Question question;
  final Function setSelectedOption;
  final int currentQuestionIndex;
  final int questionCount;
  final Function goToNextQuestion;
  final Function incrementTimeTaken;
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
                mode: CircularDotMode.PreviousSelected,
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
