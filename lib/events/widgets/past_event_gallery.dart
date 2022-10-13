import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/events/models/event.dart';
import 'package:tedx_dtu_app/events/widgets/gallery_image_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

/// Makes a Gallery, showing images in a varying height fashion.
///
/// Accepts a list of image urls [imageUrls] of type List<String>.
class PastEventGallery extends StatelessWidget {
  const PastEventGallery({Key? key}) : super(key: key);

  /// The images to be shown inside gallery.

  @override
  Widget build(BuildContext context) {
    // (Provider.of<Event>(context, listen: false) as PastEvent)
    //     .getImages(context);
    // final List<String> imageUrls =
    //     (Provider.of<Event>(context) as PastEvent).images;
    final imageUrls = (Provider.of<Event>(context) as PastEvent).previewImages;
    ;
    var mediaQuery = MediaQuery.of(context);
    // getImages()
    return Column(
      // crossAxisCount: 2,
      children: imageUrls.map((e) {
        return GalleryImageWidget(
          e,
          width: mediaQuery.size.width * 0.4,
        );
      }).toList(),
    );
  }
}
