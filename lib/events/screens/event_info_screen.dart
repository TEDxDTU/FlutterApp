import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/events/widgets/event_category_widget.dart';
import 'package:tedx_dtu_app/events/widgets/selectable_box_creator.dart';
import 'package:tedx_dtu_app/events/widgets/speaker_info_widget.dart';

/// Creates an EventInfoScreen.
///
/// [routeName] = '/event-info-screen'
///
/// Shows Speaker Info, Event Info and Gallery.
///
/// This screen receives routeArguments as a [Map<String, Object>].
class EventInfoScreen extends StatelessWidget {
  const EventInfoScreen({Key? key}) : super(key: key);
  static const routeName = '/event-info-screen';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;

    // An instance of [MediaQueryData] to make the screen responsive.
    var mediaQuery = MediaQuery.of(context);

    // Extract details from route arguments.
    final String speakerName = routeArgs['speakerName'].toString();
    final List<String> speakerDetails =
        routeArgs['speakerInfo'] as List<String>;
    final String imageUrl = routeArgs['imageUrl'].toString();
    final String eventName = routeArgs['eventName'].toString();

    // A global key to switch between Speaker Info, Event Info and Gallery
    // as requested by user.
    var selectableBoxKey = GlobalKey<SelectableBoxCreatorState>();

    // List of widgets shown in the DraggableScrollableSheet.
    List<Widget> bottomWidgets = [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SpeakerInfoWidget(
            speakerName: speakerName,
            imageUrl: imageUrl,
            personalStats: 'Dummy stats',
          ),
          SpeakerInfoWidget(
            speakerName: speakerName,
            imageUrl: imageUrl,
            personalStats: 'Dummy stats',
          ),
          SpeakerInfoWidget(
            speakerName: speakerName,
            imageUrl: imageUrl,
            personalStats: 'Dummy stats',
          ),
        ],
      ),
      Column(
        children: const [
          Text(
            'This is the event info',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
      Column(
        children: const [
          Text(
            'Idhar aayegi humari gallery',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      )
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(eventName),
      ),
      body: SizedBox(
        width: mediaQuery.size.width,
        height: mediaQuery.size.height,
        child: Stack(
          children: [
            Column(
              children: [
                EventCategoryWidget(
                  title: 'A sooper interesting TED Talk!',
                  details: [],
                  width: double.infinity,
                  height: mediaQuery.size.height * 0.25,
                  showActionWidget: false,
                ),
<<<<<<< HEAD
              ),
            ],
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.4,
            // snap: true,
            // snapSizes: const [
            //   0.4,
            //   0.6,
            // ],
            builder: (context, scrollController) {
              return Container(
                color: Colors.black,
                child: ValueListenableBuilder(
                    valueListenable: selectableBoxKey.currentState!.selectedBox,
                    builder: (context, value, _) {
                      return SingleChildScrollView(
                        controller: scrollController,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: bottomWidgets[
                              selectableBoxKey.currentState!.selectedBox.value],
                        ),
                      );
                    }),
              );
            },
          ),
        ],
=======
                Container(
                  width: double.infinity,
                  height: mediaQuery.size.height * 0.08,
                  alignment: Alignment.centerLeft,
                  child: SelectableBoxCreator(
                    key: selectableBoxKey,
                    count: 3,
                    names: const [
                      'Speaker info',
                      'Event info',
                      'Gallery',
                    ],
                  ),
                ),
              ],
            ),
            DraggableScrollableSheet(
              initialChildSize:
                  mediaQuery.orientation == Orientation.portrait ? 0.61 : 0.58,
              minChildSize:
                  mediaQuery.orientation == Orientation.portrait ? 0.61 : 0.58,
              maxChildSize: 1.0,
              snap: true,
              builder: (context, scrollController) {
                return Container(
                  color: Colors.black,
                  child: ValueListenableBuilder(
                      valueListenable:
                          selectableBoxKey.currentState!.selectedBox,
                      builder: (context, value, _) {
                        return SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          controller: scrollController,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: bottomWidgets[selectableBoxKey
                                .currentState!.selectedBox.value],
                          ),
                        );
                      }),
                );
              },
            ),
          ],
        ),
>>>>>>> a2e8a5cf0b204dd006cc85a86d4e59e93e0dfd6a
      ),
    );
  }
}
