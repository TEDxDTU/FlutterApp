import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/events/screens/events_list_screen.dart';
import 'package:tedx_dtu_app/events/widgets/event_category_widget.dart';
import 'package:tedx_dtu_app/global/widgets/bottom_bar_screen_widget.dart';

class EventsCategoriesScreen extends StatelessWidget {
  const EventsCategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomBarScreenWidget(
      children: [
        // ignore: prefer_const_constructors
        //TODO: Fetch Live data from firebase
        EventCategoryWidget(
          title: 'LIVE Event',
          details: ['Details'],
          width: double.infinity,
          actionWidget: Text('Join'),
        ),
        EventCategoryWidget(
          title: 'Upcoming Event',
          details: const ['The exciting events we will host in the future'],
          width: double.infinity,
          gradientColor: Colors.white,
          fontColor: Colors.black,
          actionWidget: const Text(
            'View',
            style: TextStyle(color: Colors.black),
          ),
          actionWidgetFunction: () {
            Navigator.of(context)
                .pushNamed(EventsListScreen.routeName, arguments: true);
          },
        ),
        EventCategoryWidget(
          title: 'Past Event',
          details: const [
            'The multitude events that TEDx DTU has hosted in the past'
          ],
          width: double.infinity,
          gradientColor: Colors.black,
          actionWidget: const Text('View'),
          actionWidgetFunction: () {
            Navigator.of(context)
                .pushNamed(EventsListScreen.routeName, arguments: false);
          },
        ),
      ],
    );
  }
}
