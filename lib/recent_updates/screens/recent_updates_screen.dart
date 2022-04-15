import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/recent_updates/helpers/grabbing_clipper.dart';
import 'package:tedx_dtu_app/recent_updates/widgets/discover_card.dart';
import '../../recent_updates/models/discover.dart';
import '../../recent_updates/models/recent_update.dart';
import '../../recent_updates/widgets/discover_grabbing.dart';
import '../../recent_updates/widgets/recent_updates_card.dart';
import '../widgets/discover_area.dart';

class RecentUpdatesScreen extends StatefulWidget {
  const RecentUpdatesScreen({Key? key}) : super(key: key);
  static const routeName = '/recent-updates-screen';

  @override
  State<RecentUpdatesScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<RecentUpdatesScreen> {
  final double _grabbingVisibleHeight = 32;

  @override
  Widget build(BuildContext context) {
    final recentUpdate = RecentUpdate(
      'Behind the stage',
      'https://cdn.pixabay.com/photo/2021/09/23/09/42/newspaper-6649286_960_720.jpg',
      'from the last episode a glimpse into how TEDx has becom a...',
      'https://www.ted.com/',
    );

    final _appBar = AppBar(
      title: const Text('Recent Updates'),
    );
    return Scaffold(
      appBar: _appBar,
      body: Stack(
        children: [
          ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(height: _grabbingVisibleHeight),
              RecentUpdatesCard(
                recentUpdate,
                onShare: () {
                  print('Send pressed');
                },
                url: 'https://www.ted.com',
              ),
              RecentUpdatesCard(
                recentUpdate,
                onShare: () {
                  print('Send pressed');
                },
                url: 'https://www.ted.com',
              ),
              RecentUpdatesCard(
                recentUpdate,
                onShare: () {
                  print('Send pressed');
                },
                url: 'https://www.ted.com',
              ),
              RecentUpdatesCard(
                recentUpdate,
                onShare: () {
                  print('Send pressed');
                },
                url: 'https://www.ted.com',
              ),
              RecentUpdatesCard(
                recentUpdate,
                onShare: () {
                  print('Send pressed');
                },
                url: 'https://www.ted.com',
              ),
              RecentUpdatesCard(
                recentUpdate,
                onShare: () {
                  print('Send pressed');
                },
                url: 'https://www.ted.com',
              ),
              const SizedBox(height: 80),
            ],
          ),
          DiscoverArea(),
        ],
      ),
    );
  }
}
