import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/global/widgets/bottom_bar_screen_widget.dart';
import 'package:tedx_dtu_app/profile/providers/profile_inner_widget_provider.dart';
import 'package:tedx_dtu_app/profile/widgets/image_upload.dart';
import 'package:tedx_dtu_app/profile/widgets/profile_card_layout_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileInnerWidgetProvider(),
      builder: (context, child) {
        return BottomBarScreenWidget(
          showTedXLogoInAppBar: false,
          appBarTitle:
              Provider.of<ProfileInnerWidgetProvider>(context).appBarTitle,
          children: [
            const SizedBox(
              height: 50,
            ),
            ProfileCardLayoutWidget(),
            const SizedBox(
              height: 200,
            ),
          ],
        );
      },
    );
  }
}
