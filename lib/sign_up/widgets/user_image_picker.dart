import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:tedx_dtu_app/sign_up/screens/sign_up_screen.dart';

/// A widget used to pick a user's image in [SignUpScreen].
/// Creates a circular widget that shows [Icons.account_circle] when image is
/// not picked, and the image otherwise. Allows upload from camera or gallery.
class UserImagePicker extends StatefulWidget {
  /// A function that runs when the image has been selected by the user.
  /// Should be used to store the image locally in a [Provider] or upload
  /// it to the server.
  final Function(File) onSelectImage;
  final bool isError;
  const UserImagePicker({
    Key? key,
    required this.onSelectImage,
    this.isError = false,
  }) : super(key: key);
  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _storedImage;

  Future<void> _takePicture(ImageSource src) async {
    final picker = ImagePicker();

    final imageFile = await picker.pickImage(
      source: src,
      imageQuality: 50,
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
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: 50,
          backgroundColor:
              widget.isError ? Colors.red : const Color(0xFFE6EBF1),
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
        const SizedBox(height: 10),
        PopupMenuButton<ImageSource>(
          tooltip: null,
          offset: const Offset(1, 30),
          onSelected: (src) {
            _takePicture(src);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(25),
            ),
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(
                  Icons.image,
                  color: Colors.white,
                ),
                const SizedBox(width: 4),
                Text(
                  'Choose a picture',
                  style: TextStyle(color: Colors.white),
                ),
              ],
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
        // Text(
        //   '*Image upload is compulsory*',
        //   style: TextStyle(
        //     color: widget.isError ? Colors.red : Colors.white,
        //     fontWeight: FontWeight.bold,
        //     fontSize: 13,
        //   ),
        // ),
      ],
    );
  }
}
