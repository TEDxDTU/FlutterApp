import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UIHelper {
  ///Generates [MaterialColor] from given [Color]
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

  ///A list of [Color]s that can be used anywhere
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

  static Future<void> showErrorDialog(
      BuildContext context, String titleText, String messageText) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        titleTextStyle: TextStyle(
          color: CupertinoColors.destructiveRed,
          fontSize: 20,
        ),
        title: Text(titleText),
        content: Text(messageText),
        contentTextStyle: TextStyle(
          color: Colors.grey[400],
          fontSize: 15.5,
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  static Future<void> showSuccessDialog(
      BuildContext context, String titleText, String messageText) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: CupertinoColors.darkBackgroundGray,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        title: Text(titleText),
        content: Text(messageText),
        contentTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 15.5,
        ),
        actions: [
          ElevatedButton(
            //green bg
            style: ElevatedButton.styleFrom(
                // primary: Colors.black,
                ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
