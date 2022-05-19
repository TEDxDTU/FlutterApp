import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/global/screens/future_screen_template.dart';
import 'package:tedx_dtu_app/recent_updates/helpers/grabbing_clipper.dart';
import 'package:tedx_dtu_app/recent_updates/provider/recent_update_provider.dart';
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
    print("building recent updates screen");
    final _appBar = AppBar(
      title: const Text('Recent Updates'),
    );
    return Scaffold(
      appBar: _appBar,
      body: Stack(
        children: [
          FutureScreenTemplate(
            future: Provider.of<RecentUpdateProvider>(context, listen: false)
                .fetchData()
                ?.call(),
            body: Consumer<RecentUpdateProvider>(
              builder: (context, recentUpdateProvider, _) {
                return ListView.builder(
                  itemCount: recentUpdateProvider.length,
                  itemBuilder: (ctx, index) => RecentUpdatesCard(
                    recentUpdateProvider.data[index],
                  ),
                );
              },
            ),
          ),
          const DiscoverArea(),
        ],
      ),
    );
  }
}
