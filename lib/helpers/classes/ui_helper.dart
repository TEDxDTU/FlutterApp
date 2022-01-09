import 'dart:math';

import 'package:flutter/material.dart';

class UIHelper {
  static MaterialColor generateMaterialColor(Color color) {
    return MaterialColor(color.value, {
      50: _tintColor(color, 0.9),
      100: _tintColor(color, 0.8),
      200: _tintColor(color, 0.6),
      300: _tintColor(color, 0.4),
      400: _tintColor(color, 0.2),
      500: color,
      600: _shadeColor(color, 0.1),
      700: _shadeColor(color, 0.2),
      800: _shadeColor(color, 0.3),
      900: _shadeColor(color, 0.4),
    });
  }

  static int tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  static Color _tintColor(Color color, double factor) => Color.fromRGBO(
      tintValue(color.red, factor),
      tintValue(color.green, factor),
      tintValue(color.blue, factor),
      1);

  static int shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  static Color _shadeColor(Color color, double factor) => Color.fromRGBO(
      shadeValue(color.red, factor),
      shadeValue(color.green, factor),
      shadeValue(color.blue, factor),
      1);
  static const List<Color> colors = [
    Colors.blue,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.indigo,
    Colors.lightBlue,
    Colors.deepPurple,
    Colors.brown,
    Colors.orangeAccent,
    Colors.indigoAccent,
    Colors.lightBlueAccent,
    Colors.deepPurpleAccent,
    Colors.deepOrangeAccent,
    Colors.amber,
    Colors.greenAccent,
    Color(0xff347C17),
    Color(0xffFBB917),
    Color(0xffC19A6B),
    Color(0xffF75D59),
    Color(0xff7D0552),
    Color(0xff6960EC),
  ];
}
