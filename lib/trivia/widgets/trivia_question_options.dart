import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/trivia/models/question.dart';
import 'package:tedx_dtu_app/trivia/widgets/trivia_timer_widget.dart';

import '../../events/widgets/selectable_box.dart';
import '../models/trivia.dart';

class TriviaQuestionOptions extends StatefulWidget {
  const TriviaQuestionOptions(
    this.question,
    this.setSelectedOption,
    this.progressWidget,
    this.goToNextQuestion,
    this.incrementTimeTaken,
    this.timerActive, {
    Key? key,
  }) : super(key: key);
  final Question question;
  final void Function(int) setSelectedOption;
  final Widget progressWidget;
  final Future<void> Function() goToNextQuestion;
  final void Function() incrementTimeTaken;
  final bool timerActive;
  @override
  State<TriviaQuestionOptions> createState() => TriviaQuestionOptionsState();
}

class TriviaQuestionOptionsState extends State<TriviaQuestionOptions> {
  late Timer _timer;

  @override
  void initState() {
    remainingTime = widget.question.seconds;
    _timer = widget.timerActive
        ? Timer.periodic(
            const Duration(seconds: 1),
            (_) {
              setState(() {
                if (remainingTime > 0) {
                  widget.incrementTimeTaken();
                  remainingTime--;
                }
                if (remainingTime == 0) {
                  _timer.cancel();
                  widget.goToNextQuestion();
                }
              });
            },
          )
        : Timer(Duration.zero, () {});
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  int remainingTime = 0;
  int _selectedAns = -1;
  @override
  Widget build(BuildContext context) {
    final List<Widget> options = [];
    widget.question.options.asMap().forEach((index, val) {
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
                  : const Color(0xFF434343),
              onTap: () {
                setState(
                  () {
                    _selectedAns = index;
                    widget.setSelectedOption(index);
                  },
                );
              },
            ),
          ),
        ),
      );
    });
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF474747),
            borderRadius: BorderRadius.circular(100),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    Container(
                      width: 4,
                      height: 4,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 32,
                      height: 32,
                      child: TriviaTimerWidget(
                        1 - remainingTime / widget.question.seconds,
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: '$remainingTime sec',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  children: const <InlineSpan>[
                    TextSpan(
                      text: ' left',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        AutoSizeText(
          widget.question.question,
          style: Theme.of(context).textTheme.headline4!.copyWith(
                fontSize: 32,
              ),
        ),
        widget.progressWidget,
        Expanded(
          child: ListView(
            children: options,
          ),
        ),
      ],
    );
  }
}
