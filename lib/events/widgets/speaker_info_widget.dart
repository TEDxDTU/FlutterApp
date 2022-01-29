import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/global/widgets/image_error_widget.dart';

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

  final String speakerName;
  final String personalStats;
  final String imageUrl;
  final Widget? loadingIndicator;
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
            Expanded(
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
                    Text(personalStats, style: const TextStyle(fontSize: 14,),),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
