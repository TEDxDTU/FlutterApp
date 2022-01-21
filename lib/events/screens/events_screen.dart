import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/events/widgets/event_widget.dart';
import 'package:tedx_dtu_app/global/screens/test_screen.dart';
import 'package:tedx_dtu_app/global/widgets/bottom_bar_screen_widget.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomBarScreenWidget(
      children: [
        EventWidget(
          title: 'LIVE Event',
          details: ['Details'],
          width: double.infinity,
        ),
        EventWidget(
          title: 'Upcoming Event',
          details: ['Details'],
          width: double.infinity,
          gradientColor: Colors.white,
          fontColor: Colors.black,
        ),
        EventWidget(
          title: 'Past Event',
          details: ['Details'],
          width: double.infinity,
          gradientColor: Colors.black,
        ),
      ],
    );
  }
}
