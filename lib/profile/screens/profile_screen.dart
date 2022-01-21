import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/global/widgets/bottom_bar_screen_widget.dart';
import 'package:tedx_dtu_app/profile/widgets/image_upload.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomBarScreenWidget(
      showTedXLogoInAppBar: false,
      appBarTitle: 'Profile',
      children: [
        const SizedBox(
          height: 50,
        ),
        Center(
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Card(
                elevation: 0,
                color: Colors.white,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width * 0.95,
                ),
              ),
              Positioned(
                top: -40,
                child: ImageUpload(onSelectImage: (_) {}),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 200,
        ),
      ],
    );
  }
}
