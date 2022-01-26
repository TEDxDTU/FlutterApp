import 'package:flutter/material.dart';

class SpeakerDetailsScreen extends StatelessWidget {
  const SpeakerDetailsScreen({Key? key}) : super(key: key);
  static const routeName = '/speaker-details';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speaker Info'),
      ),
    );
  }
}
