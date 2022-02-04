import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/events/widgets/gallery_image_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

/// Makes a Gallery, showing images in a varying height fashion.
///
/// Accepts a list of image urls [imageUrls] of type List<String>.
class PastEventGallery extends StatelessWidget {
  const PastEventGallery(this.imageUrls, {Key? key}) : super(key: key);

  /// The images to be shown inside gallery.
  final List<String> imageUrls;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    int currElement = -1;
    return Column(children: [
      StaggeredGrid.count(
        crossAxisCount: 2,
        children: imageUrls.map((e) {
          currElement++;
          return GalleryImageWidget(
            e,
            width: mediaQuery.size.width * 0.4,
            height: currElement % 3 == 0
                ? mediaQuery.size.height * 0.2
                : mediaQuery.size.height * 0.4,
          );
        }).toList(),
      ),
    ]);
  }
}
