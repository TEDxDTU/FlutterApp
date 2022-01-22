import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/events/widgets/event_category_widget.dart';
import 'package:tedx_dtu_app/global/screens/test_screen.dart';
import 'package:tedx_dtu_app/global/widgets/bottom_bar_screen_widget.dart';

class EventsCategoriesScreen extends StatelessWidget {
  const EventsCategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomBarScreenWidget(
      children: [
        EventCategoryWidget(
          title: 'LIVE Event',
          details: ['Details'],
          width: double.infinity,
        ),
        EventCategoryWidget(
          title: 'Upcoming Event',
          details: ['Details'],
          width: double.infinity,
          gradientColor: Colors.white,
          fontColor: Colors.black,
        ),
        EventCategoryWidget(
          title: 'Past Event',
          details: ['Details'],
          width: double.infinity,
          gradientColor: Colors.black,
        ),
      ],
    );
  }
}
