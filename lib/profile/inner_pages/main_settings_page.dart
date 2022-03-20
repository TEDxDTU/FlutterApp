import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/profile/providers/profile_inner_widget_provider.dart';
import 'package:tedx_dtu_app/profile/widgets/account_circle_with_text.dart';

import '../../global/providers/auth.dart';

class MainSettingsPage extends StatelessWidget {
  const MainSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Provider.of<ProfileInnerWidgetProvider>(context, listen: false)
                .currentInnerWidget = CurrentInnerWidget.mainProfile;
          },
        ),
        const SizedBox(height: 40),
        const AccountCircleWithText(text: 'Account'),
        _buildListTile('Edit Profile', () {
          Provider.of<ProfileInnerWidgetProvider>(context, listen: false)
              .currentInnerWidget = CurrentInnerWidget.editProfile;
        }),
        _buildListTile('Change Password', () {
          Provider.of<Auth>(context, listen: false).tryChangePassword(context);
        }, SizedBox()),
        const SizedBox(height: 13),
        Row(
          children: const [
            Icon(
              Icons.notifications_outlined,
              color: Colors.black,
              size: 28,
            ),
            SizedBox(width: 8),
            Text(
              'Notifications',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ],
        ),
        const Divider(
          color: Colors.grey,
          thickness: 0.7,
        ),
        _buildListTile(
          'Notifications',
          null,
          CupertinoSwitch(
            activeColor: Colors.red,
            value: Provider.of<ProfileInnerWidgetProvider>(context).notifsOn,
            onChanged: (_) {
              Provider.of<ProfileInnerWidgetProvider>(
                context,
                listen: false,
              ).reverseNotifs();
            },
          ),
        ),
        Expanded(
          child: Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
              ),
              child: const Text('Sign out'),
              onPressed: () {
                Provider.of<Auth>(context, listen: false).signOut(context);
              },
            ),
          ),
        )
      ],
    );
  }

  ListTile _buildListTile(String title, void Function()? onTap,
      [Widget? trailing]) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      visualDensity: const VisualDensity(
        horizontal: VisualDensity.minimumDensity,
        vertical: VisualDensity.minimumDensity,
      ),
      title: Text(
        title,
      ),
      trailing: trailing ??
          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.grey,
          ),
    );
  }
}
