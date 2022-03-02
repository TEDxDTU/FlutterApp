import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../helpers/widgets/color_animated_text.dart';
import '../models/live_event_info.dart';

class LiveEventInfoWidget extends StatelessWidget {
  const LiveEventInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool alignLeft = true;

    return StreamBuilder(
      stream: LiveEventInfo.fetch(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          throw snapshot.error.toString();
        }
        if (snapshot.hasData) {
          LiveEventInfo data = snapshot.data as LiveEventInfo;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8,
                ),
                child: ColorAnimatedText(
                  data.text,
                  animationDuration: const Duration(milliseconds: 400),
                ),
              ),
              ...data.textImage.map((e) {
                alignLeft = !alignLeft;
                List<Widget> children = [
                  Expanded(
                    flex: 3,
                    child: AutoSizeText(
                      e.text,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(flex: 8, child: Image.network(e.imageUrl)),
                ];
                if (alignLeft == true) {
                  var reversedChildren = children.reversed.toList();
                  children = reversedChildren;
                }
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: children,
                  ),
                );
              }).toList(),
            ],
          );
        }
        return const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8,
          ),
          child: AutoSizeText(
            'Information about the event will appear here.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
        );
      },
    );
  }
}
