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
      height: 170,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.only(
        top: 15,
        bottom: 5,
        left: 10,
        right: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[850],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (update.imageUrl != null)
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        update.imageUrl!,
                        fit: BoxFit.cover,
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
                  width: 10.0,
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        update.title,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        update.description,
                        textAlign: TextAlign.justify,
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
                      primary: Colors.grey[700],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        // side: const BorderSide(
                        //   width: 1,
                        //   color: Colors.white,
                        // ),
                      ),
                    ),
                    child: const Text(
                      'open',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(NoBottomBarScreen.routeName, arguments: {
                        'child': const WebsiteView(),
                        'url': update.url,
                      });
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
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
