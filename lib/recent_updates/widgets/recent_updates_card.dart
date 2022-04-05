import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/recent_updates/models/recent_update.dart';

class RecentUpdatesCard extends StatelessWidget {
  const RecentUpdatesCard(
    this.update, {
    required this.onThumbsUp,
    required this.onShare,
    required this.onOpenPressed,
    Key? key,
  }) : super(key: key);

  final RecentUpdate update;
  final void Function()? onThumbsUp;
  final void Function()? onShare;
  final void Function()? onOpenPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 200,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.only(
        top: 16,
        bottom: 0,
        left: 16,
        right: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: const Color(0xFF515151),
        border: Border.all(
          width: 1,
          color: Colors.white,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        update.title,
                      ),
                      Text(
                        update.description,
                      ),
                    ],
                  ),
                ),
                if (update.imageUrl != null)
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        update.imageUrl!,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF888888),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Icon(
                      Icons.thumb_up,
                      color: Colors.white,
                    ),
                    onPressed: onThumbsUp,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF888888),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                    onPressed: onShare,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 6,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF888888),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(
                          width: 1,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    child: const Text(
                      'open',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: onOpenPressed,
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
