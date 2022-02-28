import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../models/live_event_info.dart';

class LiveEventInfoWidget extends StatelessWidget {
  const LiveEventInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool alignLeft = false;

    return StreamBuilder(
      stream: LiveEventInfo.fetch(),
      builder: (context, snapshot) {
        LiveEventInfo data = snapshot.data as LiveEventInfo;
        return Column(
          children: [
            AutoSizeText(
              data.text,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            ...data.textImage.map((e) {
              alignLeft = !alignLeft;
              List<Widget> children = [
                AutoSizeText(
                  e.text,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Expanded(child: Image.network(e.imageUrl)),
              ];
              if (alignLeft == true) {
                var reversedChildren = children.reversed.toList();
                children = reversedChildren;
              }
              return Row(
                children: children,
              );
            }).toList(),
          ],
        );
      },
      initialData: LiveEventInfo(
        'Information about the event will appear here.',
        [],
      ),
    );
  }
}
