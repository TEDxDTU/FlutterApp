import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/events/widgets/event_category_widget.dart';
import 'package:tedx_dtu_app/events/widgets/selectable_box_creator.dart';
import 'package:tedx_dtu_app/global/widgets/bottom_bar_screen_widget.dart';
import 'package:tedx_dtu_app/home/widgets/upcoming_event_widget.dart';

import 'events_list_screen.dart';

class EventInfoScreen extends StatelessWidget {
  const EventInfoScreen({Key? key}) : super(key: key);
  static const routeName = '/event-info-screen';
  @override
  Widget build(BuildContext context) {
    return const BottomBarScreenWidget(
      children: [
        EventCategoryWidget(
          title: 'A sooper interesting TED Talk!',
          details: [],
          width: double.infinity,
          showActionWidget: false,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: SelectableBoxCreator(
            count: 3,
            names: [
              'Speaker info',
              'Event info',
              'Gallery',
            ],
          ),
        )
      ],
    );
  }
}
