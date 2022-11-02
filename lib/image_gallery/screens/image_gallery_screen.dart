import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/global/widgets/custom_image_widget.dart';
import 'package:tedx_dtu_app/home/screens/no_bottombar_screen.dart';
import 'package:tedx_dtu_app/image_gallery/screens/fullscreen_image_view.dart';

class ImageGalleryScreen extends StatelessWidget {
  const ImageGalleryScreen({Key? key}) : super(key: key);

  static const routeName = '/image-gallery-screen';

  @override
  Widget build(BuildContext context) {
    final imageUrls =
        ModalRoute.of(context)!.settings.arguments as List<String>;
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          ...imageUrls
              .map(
                (imgUrl) => Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(
                      NoBottomBarScreen.routeName,
                      arguments: {
                        'child': const FullscreenImageView(),
                        'imageUrl': imgUrl,
                      },
                    ),
                    child: CustomImageWidget(
                      url: imgUrl,
                    ),
                  ),
                ),
              )
              .toList()
        ],
      ),
    );
  }
}
