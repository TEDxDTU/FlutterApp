import 'package:any_link_preview/any_link_preview.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../global/widgets/custom_image_widget.dart';
import '../../global/widgets/image_error_widget.dart';
import '../../helpers/widgets/color_animated_text.dart';
import '../models/live_event_info.dart';

class LiveEventInfoWidget extends StatelessWidget {
  const LiveEventInfoWidget({Key? key}) : super(key: key);
  void _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      try {
        await launch(url);
      } catch (err) {
        throw 'Could not launch $url. Error: $err';
      }
    }
  }

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
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (data.text != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8,
                    ),
                    child: ColorAnimatedText(
                      data.text!,
                      animationDuration: const Duration(milliseconds: 400),
                    ),
                  ),
                ...data.textImage.map((e) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 16.0,
                        right: 16.0,
                        bottom: 8,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (e.imageUrl != null)
                            Expanded(
                              child: LayoutBuilder(
                                  builder: (context, constraints) {
                                return CustomImageWidget(
                                  url: e.imageUrl!,
                                  height: constraints.maxHeight,
                                );
                              }),
                            ),
                          const SizedBox(height: 4),
                          if (e.text != null)
                            AutoSizeText(
                              e.text!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
                if (data.link != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8.0,
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 5,
                      margin: EdgeInsets.zero,
                      color: Colors.white,
                      child: AnyLinkPreview(
                        key: ValueKey(data.link!),
                        link: data.link!,
                        backgroundColor: Colors.white,
                        displayDirection: uiDirection.uiDirectionHorizontal,
                        errorWidget: GestureDetector(
                          onTap: () => _launchURL(data.link),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              data.link!,
                              style: const TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),
                        removeElevation: true,
                      ),
                    ),
                  ),
              ],
            ),
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
