import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/global/widgets/bottom_bar_screen_widget.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomBarScreenWidget(
      children: [
        Container(
          height: 100,
          width: 100,
          color: Colors.red,
        ),
        Text('EVENTS'),
        Container(
          height: 100,
          width: 100,
          color: Colors.white,
        ),
      ],
    );
  }
}
