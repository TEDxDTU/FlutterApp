import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/global/widgets/image_error_widget.dart';

/// Creates a widget which shows a rounded image of speaker along with name and
/// some stats.
///
/// Takes [speakerName], [personalStats] and [imageUrl] as required arguments.
///
/// Optional [loadingIndicator] and [width].
class SpeakerInfoWidget extends StatelessWidget {
  const SpeakerInfoWidget({
    required this.speakerName,
    required this.personalStats,
    required this.imageUrl,
    this.loadingIndicator,
    double? width,
    Key? key,
  })  : width = width ?? 300,
        super(key: key);

  /// Speaker's name
  final String speakerName;

  /// Some personal Statistics of the speaker
  final String personalStats;

  /// URL to the image of the speaker.
  final String imageUrl;

  /// A custom loading indicator, if not provided, default one is used.
  final Widget? loadingIndicator;

  /// The width of the widget.
  ///
  /// Defaults to 300.
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(8),
      width: width,
      // height: height,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: width / 3,
            height: width / 3,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, exception, stackTrace) {
                  return const ImageErrorWidget();
                },
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return Center(
                    child:
                        loadingIndicator ?? const CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FittedBox(
                    child: Text(
                      speakerName,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Text(
                    personalStats,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
