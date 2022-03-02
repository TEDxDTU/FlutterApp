import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ColorAnimatedText extends StatefulWidget {
  const ColorAnimatedText(
    this.text, {
    this.color = const Color(0xffE62B1E),
    this.style,
    this.animationDuration = const Duration(
      milliseconds: 500,
    ),
    Key? key,
  }) : super(key: key);

  final String text;
  final Color color;
  final TextStyle? style;
  final Duration animationDuration;

  @override
  _ColorAnimatedTextState createState() => _ColorAnimatedTextState();
}

class _ColorAnimatedTextState extends State<ColorAnimatedText>
    with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;
  late Animation<Color?> _color1;
  late Animation<Color?> _color2;

  @override
  void initState() {
    _controller1 =
        AnimationController(vsync: this, duration: widget.animationDuration);

    _controller2 =
        AnimationController(vsync: this, duration: widget.animationDuration);

    _color1 = ColorTween(begin: widget.color, end: Colors.white).animate(
      _controller2,
    );
    _color2 = ColorTween(begin: Colors.white, end: widget.color).animate(
      _controller1,
    );

    _controller1.addListener(() {
      if (_controller1.status == AnimationStatus.completed) {
        _controller1.reverse();
      }
      setState(() {});
    });

    _controller1.forward();
    _controller2.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        var gradient = LinearGradient(
          colors: [
            _color1.value!,
            _color2.value!,
          ],
        );
        return gradient.createShader(bounds);
      },
      child: AutoSizeText(
        widget.text,
        style: widget.style ??
            const TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
      ),
    );
  }
}
