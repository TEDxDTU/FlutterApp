import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tedx_dtu_app/global/widgets/image_error_widget.dart';

/// A Widget that displays a [NetworkImage] with a [Shimmer] loading effect
/// while the image is being loaded. Uses [CachedNetworkImage] to fetch
/// and cache the image.
class CustomImageWidget extends StatelessWidget {
  const CustomImageWidget({
    Key? key,
    required this.url,
    this.height,
    this.width,
    this.fit,
  }) : super(key: key);

  /// The url of the image to be displayed
  final String url;

  /// The height of the image, defaults to double.infinity, so use with caution
  /// in a list view or [Column].
  final double? height;

  /// The width of the image, defaults to double.infinity, so use with caution
  /// in a list view or [Row].
  final double? width;

  /// How the image should be fit, defaults to [BoxFit.cover]
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height ?? double.infinity,
      width: width ?? double.infinity,
      imageUrl: url,
      placeholder: (context, url) => Material(
        child: Center(
          child: Shimmer.fromColors(
            direction: ShimmerDirection.ltr,
            child: Container(
              height: height ?? double.infinity,
              width: width ?? double.infinity,
              color: Colors.black,
            ),
            baseColor: Colors.grey[500]!,
            highlightColor: Colors.grey[100]!,
          ),
        ),
      ),
      // fadeInDuration: const Duration(milliseconds: 0),
      // fadeOutDuration: Duration(seconds: 0),
      fit: fit ?? BoxFit.cover,
      errorWidget: (context, url, error) => const ImageErrorWidget(),
    );
  }
}
