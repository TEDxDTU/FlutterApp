import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomImageWidget extends StatelessWidget {
  const CustomImageWidget({
    Key? key,
    required this.url,
  }) : super(key: key);
  final String url;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: double.infinity,
      width: double.infinity,
      imageUrl: url,
      placeholder: (context, url) => Material(
        child: Center(
          child: Shimmer.fromColors(
            // direction: ShimmerDirection.ttb,

            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black,
            ),
            baseColor: Colors.grey[500]!,
            highlightColor: Colors.grey[100]!,
          ),
        ),
      ),
      // fadeInDuration: const Duration(milliseconds: 0),
      // fadeOutDuration: Duration(seconds: 0),
      fit: BoxFit.cover,
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
