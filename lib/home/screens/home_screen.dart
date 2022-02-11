import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/events/screens/event_info_screen.dart';
import 'package:tedx_dtu_app/events/widgets/event_category_widget.dart';
import 'package:tedx_dtu_app/global/widgets/bottom_bar_screen_widget.dart';
import 'package:tedx_dtu_app/home/widgets/ted_story_widget.dart';
import 'package:tedx_dtu_app/home/widgets/ted_stories.dart';
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
        const Padding(
          padding: EdgeInsets.only(
            bottom: 8.0,
            left: 8.0,
            right: 8.0,
          ),
          child: TedStories(
            // These are to be removed later, only for showcasing purposes
            preWidgets: [
              Text(
                '|\n|\n|\n|\n|\n|\n|',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
            postWidgets: [
              Text(
                '|\n|\n|\n|\n|\n|\n|',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
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
                backgroundColor: CupertinoColors.darkBackgroundGray,
                details: const [''],
                isSvg: false,
                width: mediaQuery.size.width * 0.438,
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
                showImage: true,
                gradientColor: Colors.transparent,
                imageProvider: const svg_provider.Svg(
                  'assets/home_screen/trivia.svg',
                ),
                actionWidgetOffset: const Tuple2<double, double>(8, 8),
              ),
              EventCategoryWidget(
                backgroundColor: CupertinoColors.darkBackgroundGray,
                isSvg: false,
                title: 'Recent Updates',
                details: const [],
                width: mediaQuery.size.width * 0.438,
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
                showImage: true,
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
            color: CupertinoColors.darkBackgroundGray,
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
