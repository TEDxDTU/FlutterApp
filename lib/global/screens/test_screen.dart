import 'package:flutter/material.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import 'package:tedx_dtu_app/trivia/screens/trivia_screen.dart';

import 'package:tedx_dtu_app/trivia/widgets/circular_spinner.dart';

import '../../recent_updates/models/recent_update.dart';
import '../../recent_updates/widgets/default_grabbing.dart';
import '../../recent_updates/widgets/recent_updates_card.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);
  static const routeName = '/test';

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    final recentUpdate = RecentUpdate(
      'Behind the stage',
      'https://cdn.pixabay.com/photo/2021/09/23/09/42/newspaper-6649286_960_720.jpg',
      'from the last episode a glimpse into how TEDx has becom a...',
      'https://www.ted.com/',
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recent Updates'),
      ),
      body: SnappingSheet(
        snappingPositions: const [
          SnappingPosition.factor(positionFactor: 1),
          SnappingPosition.factor(positionFactor: 0.75),
        ],
        grabbing: const DefaultGrabbing(),
        grabbingHeight: 50,
        sheetAbove: SnappingSheetContent(
          child: Container(
            color: Colors.red,
          ),
        ),
        sheetBelow: SnappingSheetContent(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              ListView(
                children: [
                  const SizedBox(height: 20),
                  RecentUpdatesCard(recentUpdate,
                      onThumbsUp: () {}, onSend: () {}),
                  RecentUpdatesCard(recentUpdate,
                      onThumbsUp: () {}, onSend: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
