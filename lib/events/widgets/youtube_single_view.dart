import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/events/helpers/youtube_helper.dart';
import 'package:tedx_dtu_app/events/models/event.dart';
import 'package:tedx_dtu_app/global/widgets/custom_image_widget.dart';
import 'package:tedx_dtu_app/global/widgets/tedx_loading_spinner.dart';

class YoutubeSingleView extends StatelessWidget {
  const YoutubeSingleView({
    required this.videoUrl,
    Key? key,
  }) : super(key: key);

  final String videoUrl;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return FutureBuilder<Map<String, dynamic>>(
          future: getYoutubeDetails(videoUrl),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const TedxLoadingSpinner();
            }
            if (snapshot.hasError) {
              return ErrorWidget(snapshot.error!);
            }
            return Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Builder(builder: (context) {
                PastEvent event =
                    Provider.of<Event>(context, listen: true) as PastEvent;
                return Material(
                  color: (event.currVid == event.videoUrls.indexOf(videoUrl))
                      ? Theme.of(context).primaryColor
                      : null,
                  child: InkWell(
                    onTap: () {
                      event.setVid(event.videoUrls.indexOf(videoUrl));
                    },
                    child: Row(
                      children: [
                        CustomImageWidget(
                          url: snapshot.data!['thumbnail_url'],
                          height: (constraints.maxWidth * 0.45) *
                              (snapshot.data!['thumbnail_height'] /
                                  snapshot.data!['thumbnail_width']),
                          width: constraints.maxWidth * 0.45,
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: AutoSizeText(
                            snapshot.data!['title'],
                            maxFontSize: 18,
                            style:
                                Theme.of(context).textTheme.headline2?.copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            );
          },
        );
      },
    );
  }
}
