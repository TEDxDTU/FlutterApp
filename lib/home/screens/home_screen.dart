import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/events/helpers/live_indicator_painter.dart';
import 'package:tedx_dtu_app/events/widgets/event_widget.dart';
import 'package:tedx_dtu_app/events/helpers/live_indicator_painter.dart';
import 'package:tedx_dtu_app/events/widgets/live_indicator_widget.dart';
import 'package:tedx_dtu_app/global/screens/test_screen.dart';
import 'package:tedx_dtu_app/global/widgets/bottom_bar_screen_widget.dart';
import 'package:tedx_dtu_app/home/widgets/upcoming_event_widget.dart';
import 'package:tedx_dtu_app/home/widgets/upcoming_ted_talks.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomBarScreenWidget(
      children: [
        UpcomingTedTalks(
          children: [
            UpcomingEventWidget(
              leadingText: 'What is Neural Network',
              imageProvider: NetworkImage(
                  'https://enterprisersproject.com/sites/default/files/styles/google_discover/public/images/ted_talk_2019.png?itok=CPz0Ef4S'),
              dateTime: DateTime.now(),
            ),
            UpcomingEventWidget(
              leadingText: 'The surprising habits of original thinkers',
              imageProvider: NetworkImage(
                  'https://enterprisersproject.com/sites/default/files/styles/google_discover/public/images/ted_talk_2019.png?itok=CPz0Ef4S'),
              dateTime: DateTime.now(),
            ),
            UpcomingEventWidget(
              leadingText: 'The mind behind Tesla, SpaceX, SolarCity',
              imageProvider: NetworkImage(
                  'https://enterprisersproject.com/sites/default/files/styles/google_discover/public/images/ted_talk_2019.png?itok=CPz0Ef4S'),
              dateTime: DateTime.now(),
            )
          ],
        ),
      ],
    );
  }
}
