import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/trivia/models/trivia.dart';
import 'package:tedx_dtu_app/trivia/providers/trivia_provider.dart';
import 'package:tedx_dtu_app/trivia/widgets/trivia_question_options.dart';

class TriviaAttemptScreen extends StatefulWidget {
  const TriviaAttemptScreen({Key? key}) : super(key: key);
  static const routeName = '/trivia-attempt-screen';

  @override
  State<TriviaAttemptScreen> createState() => _TriviaAttemptScreenState();
}

class _TriviaAttemptScreenState extends State<TriviaAttemptScreen> {
  int _currentQuestion = 0;
  int _points = 0;
  int selectedOption = -1;
  bool _triviaEnded = false;

  void goToNextQuestion(Trivia trivia) {
    if (selectedOption ==
        trivia.questions![_currentQuestion].correctAnswerIndex) {
      _points++;
    }
    if (_currentQuestion == trivia.questionCount - 1) {
      if (_triviaEnded == true) {
        return;
      }
      _triviaEnded = true;
      Provider.of<TriviaProvider>(context, listen: false)
          .sendPoints(trivia.id, _points);
      showDialog(
        context: context,
        builder: (ctx) => WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: const Text('Trivia complete'),
            content: const Text('Than you for participating in the trivia.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(ctx); // Remove AlertDialog
                  Navigator.pop(context); // Remove TriviaAttemptScreen
                },
                child: const Text('Dismiss'),
              ),
            ],
          ),
        ),
        barrierDismissible: false,
      );
    }

    if (_currentQuestion < trivia.questionCount - 1) {
      setState(() {
        _currentQuestion++;
      });
    }
  }

  void setSelectedOption(int val) {
    selectedOption = val;
  }

  @override
  Widget build(BuildContext context) {
    final _triviaQuestionOptionsKey = GlobalKey<TriviaQuestionOptionsState>();
    var routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    Trivia trivia = routeArgs['trivia'] as Trivia;

    final progressWidget = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          trivia.questionCount,
          (index) {
            return Container(
              width: 10,
              height: 10,
              margin: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (index <= _currentQuestion
                    ? Theme.of(context).primaryColor
                    : Colors.white),
              ),
            );
          },
        ),
      ],
    );

    var appBar = AppBar(
      title: Text(trivia.title),
      automaticallyImplyLeading: false,
    );

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: appBar,
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              // Question and options
              Expanded(
                child: TriviaQuestionOptions(
                  trivia.questions![_currentQuestion],
                  setSelectedOption,
                  progressWidget,
                  trivia,
                  goToNextQuestion,
                  key: _triviaQuestionOptionsKey,
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
                  goToNextQuestion(trivia);
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
      ),
    );
  }
}
