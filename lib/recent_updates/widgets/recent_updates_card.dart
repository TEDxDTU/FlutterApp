import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/recent_updates/models/recent_update.dart';

class RecentUpdatesCard extends StatelessWidget {
  const RecentUpdatesCard(
    this.update, {
    required this.onThumbsUp,
    required this.onSend,
    Key? key,
  }) : super(key: key);

  final RecentUpdate update;
  final Function onThumbsUp;
  final Function onSend;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
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
                Expanded(
                  flex: 2,
                  child: Image.network(
                    update.imageUrl,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: IconButton(
                    icon: const Icon(
                      Icons.thumb_up,
                    ),
                    onPressed: onThumbsUp(),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: onSend(),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: ElevatedButton(
                    // style: ElevatedButton.styleFrom(shape: OutlinedBorder,),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                    child: const Text(
                      'open',
                    ),
                    onPressed: onThumbsUp(),
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
