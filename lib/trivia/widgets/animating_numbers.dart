import 'package:flutter/material.dart';

class AnimatingNumbers extends StatefulWidget {
  const AnimatingNumbers({
    Key? key,
    required this.onComplete,
  }) : super(key: key);
  final void Function() onComplete;
  @override
  State<AnimatingNumbers> createState() => _AnimatingNumbersState();
}

class _AnimatingNumbersState extends State<AnimatingNumbers>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int topNumber = 3;
  int lowNumber = 1;
  String current = 3.toString();
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _startAnimation();
    super.initState();
  }

  Future<void> _startAnimation() async {
    for (int i = topNumber; i >= lowNumber; i--) {
      print(i);
      setState(() {
        current = i.toString();
      });
      await _controller.forward();
      _controller.reset();
      // await Future.delayed(Duration(milliseconds: 200));
    }
    setState(() {
      current = 'START';
    });
    await _controller.forward();
    widget.onComplete.call();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller.drive(
        Tween(begin: 1.0, end: 0),
      ),
      child: ScaleTransition(
        scale: _controller,
        child: FittedBox(
          child: Text(
            current,
            style: TextStyle(
              fontSize: 150,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
