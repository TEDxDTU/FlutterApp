import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/trivia/widgets/trivia_timer_painter.dart';

class TriviaTimerWidget extends StatelessWidget {
  const TriviaTimerWidget(this.progress, {Key? key}) : super(key: key);

  final double progress;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 1.5,
            color: Colors.white,
          ),
        ),
      ),
      painter: TriviaTimerPainter(Colors.red, progress),
    );
  }
}
