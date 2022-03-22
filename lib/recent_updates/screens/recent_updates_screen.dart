import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/global/screens/future_screen_template.dart';
import 'package:tedx_dtu_app/recent_updates/widgets/recent_updates_card.dart';

import '../models/recent_update.dart';

class RecentUpdatesScreen extends StatelessWidget {
  const RecentUpdatesScreen({Key? key}) : super(key: key);

  static const routeName = '/recent-updates-screen';

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
      body: ListView(
        children: [
          RecentUpdatesCard(recentUpdate, onThumbsUp: () {}, onSend: () {}),
          RecentUpdatesCard(recentUpdate, onThumbsUp: () {}, onSend: () {}),
        ],
      ),
    );
  }
}
