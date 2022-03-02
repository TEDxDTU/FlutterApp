import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../global/widgets/image_error_widget.dart';
import '../../helpers/widgets/color_animated_text.dart';
import '../models/live_event_info.dart';

class LiveEventInfoWidget extends StatelessWidget {
  const LiveEventInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: LiveEventInfo.fetch(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          throw snapshot.error.toString();
        }
        if (snapshot.hasData) {
          LiveEventInfo data = snapshot.data as LiveEventInfo;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    bottom: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.network(
                          e.imageUrl,
                          errorBuilder: (context, object, stackTrace) {
                            return const ImageErrorWidget();
                          },
                          fit: BoxFit.fitWidth,
                          loadingBuilder: (context, child, progress) {
                            if (progress == null) {
                              return child;
                            }
                            return const CircularProgressIndicator();
                          },
                        ),
                      ),
                      AutoSizeText(
                        e.text,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    ],
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
