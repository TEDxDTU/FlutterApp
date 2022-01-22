import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

/// Creates a circular avatar that displays an image or a profile icon,
/// with an edit icon that allows the user to select a new image.
class ImageUpload extends StatefulWidget {
  /// The function that is called when the image has been selected by the user,
  /// either from the camera or from the phone gallery. Should be used to
  /// save the image to server or locally.
  final Function(File) onSelectImage;

  /// The initial image to display, if one is available. If null, a profile icon
  /// is displayed.
  final File? image;

  const ImageUpload({
    Key? key,
    required this.onSelectImage,
    this.image,
  }) : super(key: key);
  @override
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  File? _storedImage;

  Future<void> _takePicture(ImageSource src) async {
    final picker = ImagePicker();

    final imageFile = await picker.pickImage(
      source: src,
    );

    if (imageFile == null) return;

    setState(() {
      _storedImage = File(imageFile.path);
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(_storedImage!.path);
    final savedImage = await _storedImage!.copy('${appDir.path}/$fileName');
    widget.onSelectImage(savedImage);
  }

  @override
  void initState() {
    _storedImage = widget.image;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle, color: Colors.white,
            // borderRadius: BorderRadius.circular(200),
          ),
          height: 110,
          width: 110,
          child: Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[300],
            ),
            child: _storedImage != null
                ? ClipOval(
                    child: Image.file(
                      _storedImage!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  )
                : Icon(
                    Icons.person,
                    size: 70,
                    color: Colors.grey[900],
                  ),
          ),
        ),
        Positioned(
          bottom: 5,
          right: 5,
          child: PopupMenuButton<ImageSource>(
            tooltip: null,
            offset: const Offset(1, 30),
            onSelected: (src) {
              _takePicture(src);
            },
            // color: Colors.grey[300],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 10,
            child: CircleAvatar(
              backgroundColor: Colors.red,
              radius: 15,
              child: Icon(
                Icons.edit,
                color: Colors.white,
                size: 15,
              ),
            ),
            itemBuilder: (ctx) {
              return [
                PopupMenuItem(
                  value: ImageSource.camera,
                  child: Row(
                    children: const [
                      Icon(Icons.camera),
                      SizedBox(width: 10),
                      Text('Take picture'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: ImageSource.gallery,
                  child: Row(
                    children: const [
                      Icon(Icons.upload),
                      SizedBox(width: 10),
                      const Text('Upload picture'),
                    ],
                  ),
                ),
              ];
            },
          ),
        ),
      ],
    );
  }
}
