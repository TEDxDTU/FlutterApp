import 'dart:math';

import 'package:flutter/material.dart';

import '../helpers/grabbing_clipper.dart';

class DefaultGrabbing extends StatelessWidget {
  const DefaultGrabbing({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: GrabbingClipper(),
      child: Container(
        alignment: Alignment.bottomCenter,
        width: MediaQuery.of(context).size.width,
        height: 80,
        color: Colors.red,
        child: Text('Discover'),
      ),
    );
  }
}
