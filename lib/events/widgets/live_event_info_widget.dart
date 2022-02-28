import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../models/live_event_info.dart';

class LiveEventInfoWidget extends StatelessWidget {
  const LiveEventInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool alignLeft = true;
    String previousText = '';

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
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    ColorizeAnimatedText(
                      data.text,
                      colors: [
                        Colors.white,
                        Colors.white,
                        const Color(0xffE62B1E),
                        Colors.white,
                      ],
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                      ),
                    ),
                  ],
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
        return Container();
      },
      // initialData: LiveEventInfo(
      //   'Information about the event will appear here.',
      //   [],
      // ),
    );
  }
}
