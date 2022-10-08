import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/recent_updates/models/recent_update.dart';
import 'package:tedx_dtu_app/recent_updates/screens/webview_screen.dart';
import 'package:share_plus/share_plus.dart';

import '../../home/screens/no_bottombar_screen.dart';

class RecentUpdatesCard extends StatelessWidget {
  const RecentUpdatesCard(
    this.update, {
    Key? key,
  }) : super(key: key);

  final RecentUpdate update;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 180,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.only(
        top: 16,
        bottom: 0,
        left: 16,
        right: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.grey[850],
        // border: Border.all(
        //   width: 1,
        //   color: Colors.white,
        // ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                if (update.imageUrl != null)
                  Expanded(
                    flex: 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        update.imageUrl!,
                        fit: BoxFit.fill,
                        loadingBuilder: (context, child, progress) {
                          if (progress == null) return child;
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                    ),
                  ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        update.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Flexible(
                        child: Text(update.description),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 6,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey[600],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        // side: const BorderSide(
                        //   width: 1,
                        //   color: Colors.white,
                        // ),
                      ),
                    ),
                    child: const Text(
                      'open',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(NoBottomBarScreen.routeName, arguments: {
                        'child': WebsiteView(),
                        'url': update.url,
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Share.share(
                          'Hey! Come check this update in TEDxDTU application\n${update.url}');
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
