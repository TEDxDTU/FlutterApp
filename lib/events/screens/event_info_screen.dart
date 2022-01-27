import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/events/widgets/event_category_widget.dart';
import 'package:tedx_dtu_app/events/widgets/selectable_box_creator.dart';
import 'package:tedx_dtu_app/global/widgets/bottom_bar_screen_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class EventInfoScreen extends StatelessWidget {
  const EventInfoScreen({Key? key}) : super(key: key);
  static const routeName = '/event-info-screen';

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    const eventCategoryHeight = 50.0;

    const eventCategoryWidget = EventCategoryWidget(
      title: 'A sooper interesting TED Talk!',
      details: [],
      width: double.infinity,
      showActionWidget: false,
    );
    return BottomBarScreenWidget(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Column(
                children: const [
                  eventCategoryWidget,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      height: eventCategoryHeight,
                      child: SelectableBoxCreator(
                        count: 3,
                        names: [
                          'Speaker info',
                          'Event info',
                          'Gallery',
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SlidingUpPanel(
                minHeight: mediaQuery.size.height -
                    eventCategoryWidget.widgetHeight -
                    eventCategoryHeight -
                    mediaQuery.viewPadding.top,
                maxHeight: mediaQuery.size.height,
                color: Colors.transparent,
                panel: Container(
                  child: const Center(
                    child: Text("This is the sliding Widget"),
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
