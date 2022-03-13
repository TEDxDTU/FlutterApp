import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/trivia/models/question.dart';

import '../../events/widgets/selectable_box.dart';

class TriviaQuestionOptions extends StatefulWidget {
  const TriviaQuestionOptions(this.question, {Key? key}) : super(key: key);
  final Question question;

  @override
  State<TriviaQuestionOptions> createState() => _TriviaQuestionOptionsState();
}

class _TriviaQuestionOptionsState extends State<TriviaQuestionOptions> {
  @override
  void initState() {
    questionTimer =
        Timer.periodic(Duration(seconds: widget.question.seconds), (timer) {
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

  late Timer questionTimer;

  @override
  void didChangeDependencies() {
    remainingTime = widget.question.seconds;
    super.didChangeDependencies();
  }

  int remainingTime = 3;
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          remainingTime.toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        AutoSizeText(
          widget.question.question,
          style: Theme.of(context).textTheme.headline4!.copyWith(
                fontSize: 32,
              ),
        ),
        Expanded(
          child: ListView(
            children: options,
          ),
        ),
      ],
    );
  }
}
