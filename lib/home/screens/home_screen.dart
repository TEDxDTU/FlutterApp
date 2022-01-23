import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tedx_dtu_app/events/helpers/live_indicator_painter.dart';
import 'package:tedx_dtu_app/events/widgets/event_category_widget.dart';
import 'package:tedx_dtu_app/events/helpers/live_indicator_painter.dart';
import 'package:tedx_dtu_app/events/widgets/live_indicator_widget.dart';
import 'package:tedx_dtu_app/global/screens/test_screen.dart';
import 'package:tedx_dtu_app/global/widgets/bottom_bar_screen_widget.dart';
import 'package:tedx_dtu_app/home/widgets/upcoming_event_widget.dart';
import 'package:tedx_dtu_app/home/widgets/upcoming_ted_talks.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg_provider;
import 'package:tuple/tuple.dart';

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
          child: UpcomingTedTalks(
            children: [
              UpcomingEventWidget(
                onPressed: () {
                  print('Take the user to event info');
                },
                leadingText: 'What is Neural Network',
                imageProvider: const NetworkImage(
                    'https://enterprisersproject.com/sites/default/files/styles/google_discover/public/images/ted_talk_2019.png?itok=CPz0Ef4S'),
                dateTime: DateTime.now(),
                isLive: true,
              ),
              UpcomingEventWidget(
                onPressed: () {
                  print('Take the user to event info');
                },
                leadingText: 'The surprising habits of original thinkers',
                imageProvider: const NetworkImage(
                    'https://enterprisersproject.com/sites/default/files/styles/google_discover/public/images/ted_talk_2019.png?itok=CPz0Ef4S'),
                dateTime: DateTime.now(),
              ),
              UpcomingEventWidget(
                onPressed: () {
                  print('Take the user to event info');
                },
                leadingText: 'The mind behind Tesla, SpaceX, SolarCity',
                imageProvider: const NetworkImage(
                    'https://enterprisersproject.com/sites/default/files/styles/google_discover/public/images/ted_talk_2019.png?itok=CPz0Ef4S'),
                dateTime: DateTime.now(),
              )
            ],
          ),
        ),
        // TODO: Implement Expanded here.
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              EventCategoryWidget(
                title: '',
                details: const [],
                isSvg: true,
                width: mediaQuery.size.width * 0.42,
                height: mediaQuery.size.width * 0.42 * 1.275,
                actionButton: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    ),
                    onPressed: () {},
                  ),
                ),
                gradientColor: Colors.transparent,
                imageProvider: const svg_provider.Svg(
                  'assets/home_screen/trivia.svg',
                ),
                actionWidgetOffset: const Tuple2<double, double>(8, 8),
              ),
              EventCategoryWidget(
                isSvg: true,
                title: '',
                details: const [],
                width: mediaQuery.size.width * 0.42,
                height: mediaQuery.size.width * 0.42 * 1.275,
                actionButton: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    ),
                    onPressed: () {},
                  ),
                ),
                gradientColor: Colors.transparent,
                imageProvider: const svg_provider.Svg(
                  'assets/home_screen/recent_updates.svg',
                ),
                actionWidgetOffset: const Tuple2<double, double>(8, 8),
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
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
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
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
