import 'dart:io' show Platform, Directory;

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_view/photo_view.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tedx_dtu_app/global/widgets/image_error_widget.dart';

class FullscreenImageView extends StatelessWidget {
  const FullscreenImageView({Key? key}) : super(key: key);

  static const routeName = '/fullscreen-image-view';

  @override
  Widget build(BuildContext context) {
    final String imageUrl = (ModalRoute.of(context)!.settings.arguments
        as Map)['imageUrl'] as String;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () async {
          await requestDownload(imageUrl, 'image-name');
        },
        child: Icon(
          Icons.download,
          color: Theme.of(context).primaryColor,
        ),
      ),
      body: PhotoView(
        minScale: PhotoViewComputedScale.contained,
        maxScale: PhotoViewComputedScale.covered * 2,
        imageProvider: NetworkImage(imageUrl),
        loadingBuilder: (BuildContext context, ImageChunkEvent? progress) =>
            Material(
          child: Center(
            child: Shimmer.fromColors(
              direction: ShimmerDirection.ltr,
              child: Container(
                // height: height ?? double.infinity,
                // width: width ?? double.infinity,
                color: Colors.black,
              ),
              baseColor: Colors.grey[500]!,
              highlightColor: Colors.grey[100]!,
            ),
          ),
        ),
        errorBuilder: (context, error, stackTrace) => const ImageErrorWidget(),
      ),
    );
  }
}

Future<void> requestDownload(String url, String name) async {
  final String path;
  // if (Platform.isAndroid) {
  //   path = await ExternalPath.getExternalStoragePublicDirectory(
  //       ExternalPath.DIRECTORY_DOWNLOADS);
  // } else {
  //   // the function below must store data to iOS's Application documents directory
  //   path = (await getApplicationDocumentsDirectory()).path;
  // }

  path = (await getApplicationDocumentsDirectory()).path;

  var _localPath = path + '/' + name;
  final savedDir = Directory(_localPath);
  print('mydir: $savedDir');
  await savedDir.create(recursive: true).then((value) async {
    String? _taskid = await FlutterDownloader.enqueue(
      url: url,
      fileName: name,
      savedDir: _localPath,
      showNotification: true,
      openFileFromNotification: false,
    );
    print(_taskid);
  });
}
