import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tedx_dtu_app/global/widgets/image_error_widget.dart';
import 'package:transparent_image/transparent_image.dart';

/// Shows an image from given [imageUrl].
///
/// Accepts url of Image [imageUrl], width of the image [width], optional height
/// of the image [height].
///
/// [height] defaults to 200.
class GalleryImageWidget extends StatefulWidget {
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
  State<GalleryImageWidget> createState() => _GalleryImageWidgetState();
}

class _GalleryImageWidgetState extends State<GalleryImageWidget> {
  late Image _image;

  bool _isLoading = true;
  bool _isError = false;
  // @override
  // void initState() {
  //   _image = Image.network(
  //     widget.imageUrl,
  //     width: widget.width,
  //     fit: BoxFit.cover,
  //   );
  //   _image.image.resolve(ImageConfiguration.empty).addListener(
  //         ImageStreamListener(
  //           (info, val) {
  //             if (mounted) {
  //               setState(() {
  //                 _isLoading = false;
  //               });
  //             }
  //           },
  //           onError: (error, stackTrace) {
  //             if (mounted) {
  //               setState(() {
  //                 _isError = true;
  //               });
  //             }
  //           },
  //         ),
  //       );
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        child: AnimatedSize(
          alignment: Alignment.topCenter,
          duration: const Duration(milliseconds: 500),
          child: Container(
            constraints: BoxConstraints(
              minHeight: 50,
            ),
            width: widget.width,
            child: CachedNetworkImage(
              imageUrl: widget.imageUrl,
              fit: BoxFit.cover,
              placeholder: (_, __) => CircularProgressIndicator(),
              errorWidget: (_, __, ___) => ImageErrorWidget(),
            ),
            // child: _isError
            //     ? ImageErrorWidget()
            //     : _isLoading
            //         ? CircularProgressIndicator()
            //         : _image,
          ),
        ),
      ),
    );
  }
}
