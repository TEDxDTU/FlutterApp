import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/trivia/models/trivia.dart';
import 'package:tedx_dtu_app/trivia/providers/trivia_provider.dart';
import 'package:tedx_dtu_app/trivia/screens/trivia_question_screen.dart';
import 'package:tedx_dtu_app/trivia/widgets/circular_dots_row.dart';
import 'package:tedx_dtu_app/trivia/widgets/rotating_widget.dart';
import 'package:tedx_dtu_app/trivia/widgets/trivia_question_options.dart';

class TriviaAttemptScreen extends StatefulWidget {
  const TriviaAttemptScreen({Key? key}) : super(key: key);
  static const routeName = '/trivia-attempt-screen';

  @override
  State<TriviaAttemptScreen> createState() => _TriviaAttemptScreenState();
}

class _TriviaAttemptScreenState extends State<TriviaAttemptScreen>
    with WidgetsBindingObserver {
  int _currentQuestion = 0;
  int _points = 0;
  int selectedOption = -1;
  // bool _triviaEnded = false;
  int timeTaken = 0;
  late Trivia _trivia;
  bool _isInit = true;
  final GlobalKey<RotatingWidgetState> _rotatingWidgetKey =
      GlobalKey<RotatingWidgetState>();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      var routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
      _trivia = routeArgs['trivia'] as Trivia;

      _isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive) {
      // _trivia = _trivia ?? trivia;
      setState(() {
        goToNextQuestion();
      });
    }
    super.didChangeAppLifecycleState(state);
  }

  void incrementTimeTaken() {
    timeTaken++;
  }

  Future<void> goToNextQuestion() async {
    print('Time taken: $timeTaken');
    if (selectedOption ==
        _trivia.questions![_currentQuestion].correctAnswerIndex) {
      _points += 10;
    }
    if (_currentQuestion == _trivia.questionCount - 1) {
      Provider.of<TriviaProvider>(context, listen: false)
          .sendPoints(_trivia.id, _points, timeTaken);
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
    } else if (_currentQuestion < _trivia.questionCount - 1) {
      await _rotatingWidgetKey.currentState?.start();
      setState(() {
        _currentQuestion++;
      });
    }
  }

  void setSelectedOption(int val) {
    selectedOption = val;
  }

  static const _triviaQuestionOptionsKey = ValueKey("thisQuestionKey");
  static const _nextQuestionOptionsKey = ValueKey("nextQuestionKey");
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: RotatingWidget(
        key: _rotatingWidgetKey,
        width: MediaQuery.of(context).size.width,
        duration: const Duration(milliseconds: 500),
        leftChild: Container(
          key: ValueKey("TriviaAttemptScreen$_currentQuestion"),
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          // child: buildScreen(
          //   _currentQuestion,
          //   _triviaQuestionOptionsKey,
          //   true,
          // ),
          child: TriviaQuestionScreen(
            currentQuestionIndex: _currentQuestion,
            goToNextQuestion: goToNextQuestion,
            incrementTimeTaken: incrementTimeTaken,
            isTop: true,
            question: _trivia.questions![_currentQuestion],
            questionCount: _trivia.questionCount,
            setSelectedOption: setSelectedOption,
            title: _trivia.title,
            key: _triviaQuestionOptionsKey,
          ),
        ),
        rightChild: (_currentQuestion + 1 < _trivia.questionCount)
            ? Container(
                key: ValueKey("TriviaAttemptScreen${_currentQuestion + 1}"),
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: TriviaQuestionScreen(
                  currentQuestionIndex: _currentQuestion + 1,
                  goToNextQuestion: goToNextQuestion,
                  incrementTimeTaken: incrementTimeTaken,
                  isTop: false,
                  question: _trivia.questions![_currentQuestion + 1],
                  questionCount: _trivia.questionCount,
                  setSelectedOption: setSelectedOption,
                  title: _trivia.title,
                  key: _nextQuestionOptionsKey,
                ),
              )
            : const SizedBox(),
      ),
    );
  }
}
//   Widget buildScreen(int questionIndex, Key key, bool isTop) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(_trivia.title),
//         automaticallyImplyLeading: false,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           // Question and options
//           Expanded(
//             child: TriviaQuestionOptions(
//               _trivia.questions![questionIndex],
//               setSelectedOption,
//               CircularDotsRow(
//                 currentIndex: _currentQuestion,
//                 maxIndex: _trivia.questionCount,
//                 mode: CircularDotMode.PreviousSelected,
//               ),
//               goToNextQuestion,
//               incrementTimeTaken,
//               isTop,
//               key: key,
//             ),
//           ),
//           ElevatedButton(
//             style: ButtonStyle(
//               shape: MaterialStateProperty.all(
//                 RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(18),
//                 ),
//               ),
//             ),
//             onPressed: () {
//               goToNextQuestion();
//             },
//             child: SizedBox(
//               width: 80,
//               child: Row(
//                 children: const [
//                   Text('Proceed'),
//                   Icon(
//                     Icons.arrow_forward_rounded,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
