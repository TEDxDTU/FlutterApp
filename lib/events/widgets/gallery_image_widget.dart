import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/global/widgets/image_error_widget.dart';
import 'package:transparent_image/transparent_image.dart';

/// Shows an image from given [imageUrl].
///
/// Accepts url of Image [imageUrl], width of the image [width], optional height
/// of the image [height].
///
/// [height] defaults to 200.
class GalleryImageWidget extends StatelessWidget {
  const GalleryImageWidget(
    this.imageUrl, {
    this.loadingIndicator,
    double? height,
    required this.width,
    Key? key,
  })  : height = height ?? 200,
        super(key: key);

  /// A custom loading indicator, if not provided, [CircularProgressIndicator]
  /// is used by default.
  final Widget? loadingIndicator;

  /// Url of the image to be loaded.
  final String imageUrl;

  /// Height of the widget.
  final double height;

  /// Width of the widget.
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        child: SizedBox(
          width: width,
          height: height,
          child: FadeInImage.memoryNetwork(
            fit: BoxFit.cover,
            imageErrorBuilder: (context, error, stackTrace) {
              return const ImageErrorWidget();
            },
            image: imageUrl,
            // TODO: Replace transparent image (and respective package?)
            // after deciding the placeholder
            // Code for the simple network image with error and loadingBuilders
            // is commented for future use
            placeholder: kTransparentImage,
          ),
          // Image.network(
          //   imageUrl,
          //   fit: BoxFit.cover,
          //   errorBuilder: (context, error, stackTrace) {
          //     return const ImageErrorWidget();
          //   },
          //   loadingBuilder: (context, child, progress) {
          //     if (progress == null) return child;
          //     print('Loading...');
          //     return Center(
          //       child: loadingIndicator ?? const CircularProgressIndicator(),
          //     );
          //   },
          // ),
        ),
      ),
    );
  }
}
