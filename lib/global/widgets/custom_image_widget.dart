import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomImageWidget extends StatelessWidget {
  const CustomImageWidget({
    Key? key,
    required this.url,
    this.height,
    this.width,
    this.fit,
  }) : super(key: key);
  final String url;
  final double? height;
  final double? width;
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
            // direction: ShimmerDirection.ttb,

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
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
