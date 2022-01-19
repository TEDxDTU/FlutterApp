import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/sign_up/helpers/sign_up_image_clipper.dart';
import 'package:tedx_dtu_app/sign_up/helpers/sign_up_image_outline_painter.dart';

class SignUpImageWidget extends StatelessWidget {
  const SignUpImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SignUpImageOutlinePainter(),
      child: ClipPath(
        clipper: SignUpImageClipper(),
        child: Container(
          foregroundDecoration: BoxDecoration(color: Colors.black45),
          child: Image.asset(
            'assets/images/dtu_bg.jpeg',
            width: double.infinity,
            height: 220,
            fit: BoxFit.cover,
            color: Colors.black,
            colorBlendMode: BlendMode.saturation,
          ),
        ),
      ),
    );
  }
}
