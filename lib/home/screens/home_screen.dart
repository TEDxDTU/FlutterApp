import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/events/models/live_event.dart';
import 'package:tedx_dtu_app/events/screens/event_info_screen.dart';
import 'package:tedx_dtu_app/events/widgets/event_category_widget.dart';
import 'package:tedx_dtu_app/global/widgets/bottom_bar_screen_widget.dart';
import 'package:tedx_dtu_app/recent_updates/screens/recent_updates_screen.dart';
import 'package:tedx_dtu_app/trivia/screens/trivia_screen.dart';
import 'package:tedx_dtu_app/home/widgets/ted_story_widget.dart';
import 'package:tedx_dtu_app/home/widgets/ted_stories.dart';
import 'package:tuple/tuple.dart';

import '../../events/screens/events_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return BottomBarScreenWidget(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 8.0,
            left: 8.0,
            right: 8.0,
          ),
          child: TedStories(
            // These are to be removed later, only for showcasing purposes
            preWidgets: [
              StreamBuilder(
                  stream: LiveEvent.fetch().asBroadcastStream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting &&
                        LiveEvent.instance == null) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return TedStoryWidget(
                      leadingText: LiveEvent.instance!.title,
                      isLive: true,
                      dateTime: LiveEvent.instance!.date,
                      imageUrl: LiveEvent.instance!.imageUrl,
                      width: mediaQuery.size.width / 3,
                      // height: (mediaQuery.size.height -
                      //         mediaQuery.padding.top -
                      //         kToolbarHeight) *
                      //     0.4,
                      borderRadius: 27,
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(EventInfoScreen.routeName, arguments: {
                          'eventType': 'live',
                        });
                      },
                    );
                  })
            ],
          ),
        ),
        // TODO: Implement Expanded here.
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: EventCategoryWidget(
                  title: '',
                  backgroundColor: CupertinoColors.darkBackgroundGray,
                  details: const [''],
                  isSvg: true,
                  width: mediaQuery.size.width * 0.438,
                  height: mediaQuery.size.width * 0.42 * 1.275,
                  actionButton: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      splashRadius: 28,
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(TriviaScreen.routeName);
                      },
                    ),
                  ),
                  showImage: true,
                  gradientColor: Colors.transparent,
                  svgAsset: 'assets/home_screen/trivia.svg',
                  actionWidgetOffset: const Tuple2<double, double>(8, 8),
                ),
              ),
              Expanded(
                child: EventCategoryWidget(
                  backgroundColor: CupertinoColors.darkBackgroundGray,
                  isSvg: true,
                  title: 'Recent Updates',
                  details: const [],
                  width: mediaQuery.size.width * 0.438,
                  height: mediaQuery.size.width * 0.42 * 1.275,
                  actionButton: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      splashRadius: 28,
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(RecentUpdatesScreen.routeName);
                      },
                    ),
                  ),
                  gradientColor: Colors.transparent,
                  showImage: true,
                  svgAsset: 'assets/home_screen/recent_updates.svg',
                  actionWidgetOffset: const Tuple2<double, double>(8, 8),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          // height: 300,
          decoration: BoxDecoration(
            color: CupertinoColors.darkBackgroundGray,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.25),
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Row(
            children: [
              const Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Book tickets for upcoming ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: 'TED talks!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text(
                  'Pre-Book now',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        20,
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  print('Redirect to ticket screen');
                  Navigator.of(context)
                      .pushNamed(EventsListScreen.routeName, arguments: true);
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
