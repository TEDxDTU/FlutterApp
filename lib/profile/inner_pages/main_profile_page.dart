import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/global/widgets/labelled_widget.dart';
import 'package:tedx_dtu_app/profile/providers/profile_inner_widget_provider.dart';

class MainProfilePage extends StatelessWidget {
  const MainProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {
              Provider.of<ProfileInnerWidgetProvider>(context, listen: false)
                  .currentInnerWidget = CurrentInnerWidget.mainSettings;
            },
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Satvik Gupta',
          style: Theme.of(context).textTheme.headline5,
        ),
        Text(
          'Delhi Technological University',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const SizedBox(height: 10),
        const Divider(
          color: Colors.grey,
        ),
        const SizedBox(height: 20),
        const Align(
          alignment: Alignment.centerLeft,
          child: LabelledWidget(
            spacing: 7,
            label: 'Mobile',
            child: Text(
              '9910119645',
              style: TextStyle(fontSize: 17),
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Align(
          alignment: Alignment.centerLeft,
          child: LabelledWidget(
            spacing: 7,
            label: 'Email',
            child: Text(
              'satvik.sli@gmail.com',
              style: TextStyle(fontSize: 17),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
              ),
              child: const Text('Sign out'),
              onPressed: () {},
            ),
          ),
        )
      ],
    );
  }
}
