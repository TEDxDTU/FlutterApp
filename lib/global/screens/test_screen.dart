import 'package:flutter/material.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import 'package:tedx_dtu_app/recent_updates/widgets/discover_card.dart';
import 'package:tedx_dtu_app/trivia/screens/trivia_screen.dart';

import 'package:tedx_dtu_app/trivia/widgets/circular_spinner.dart';

import '../../recent_updates/helpers/grabbing_clipper.dart';
import '../../recent_updates/models/discover.dart';
import '../../recent_updates/models/recent_update.dart';
import '../../recent_updates/widgets/discover_grabbing.dart';
import '../../recent_updates/widgets/recent_updates_card.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);
  static const routeName = '/test';

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  double _discoverPosition = 0;
  @override
  Widget build(BuildContext context) {
    final recentUpdate = RecentUpdate(
      'Behind the stage',
      'https://cdn.pixabay.com/photo/2021/09/23/09/42/newspaper-6649286_960_720.jpg',
      'from the last episode a glimpse into how TEDx has becom a...',
      'https://www.ted.com/',
    );
    final discover = Discover(
        imageUrl:
            'https://via.placeholder.com/160x230/00eaff/969696.png?text=Placeholder+Image',
        title: 'Trivia results are out');
    final _appBar = AppBar(
      title: const Text('Recent Updates'),
    );
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: _appBar,
      body: Stack(
        children: [
          Positioned(
            child: ListView(
              children: [
                RecentUpdatesCard(
                  recentUpdate,
                  onThumbsUp: () {
                    print('Thumbs up pressed');
                  },
                  onSend: () {
                    print('Send pressed');
                  },
                  onOpenPressed: () {
                    print('Pressed open');
                  },
                ),
                RecentUpdatesCard(
                  recentUpdate,
                  onThumbsUp: () {
                    print('Thumbs up pressed');
                  },
                  onSend: () {
                    print('Send pressed');
                  },
                  onOpenPressed: () {
                    print('Pressed open');
                  },
                ),
              ],
            ),
          ),
          Positioned(
            top: _discoverPosition,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    color: Colors.red,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        DiscoverCard(discover),
                        DiscoverCard(discover),
                      ],
                    ),
                  ),
                  GestureDetector(
                    child:
                        const SizedBox(height: 40, child: DiscoverGrabbing()),
                    onVerticalDragUpdate: (DragUpdateDetails dragStartDetails) {
                      if (dragStartDetails.globalPosition.dy >
                              mediaQuery.size.height * 0.5 ||
                          dragStartDetails.globalPosition.dy < 40) {
                        return;
                      }
                      setState(() {
                        _discoverPosition = dragStartDetails.globalPosition.dy -
                            mediaQuery.size.height * 0.5 -
                            mediaQuery.padding.top;
                      });
                    },
                    onVerticalDragStart: (DragStartDetails dragStartDetails) {
                      setState(() {
                        _discoverPosition = dragStartDetails.globalPosition.dy -
                            mediaQuery.size.height * 0.5 -
                            mediaQuery.padding.top;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
