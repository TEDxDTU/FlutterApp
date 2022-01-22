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
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {
              Provider.of<ProfileInnerWidgetProvider>(context, listen: false)
                  .currentInnerWidget = CurrentInnerWidget.mainSettings;
            },
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Satvik Gupta',
          style: Theme.of(context).textTheme.headline5,
        ),
        Text(
          'Delhi Technological University',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        SizedBox(height: 10),
        Divider(
          color: Colors.grey,
        ),
        SizedBox(height: 20),
        Align(
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
        SizedBox(height: 20),
        Align(
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
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
              ),
              child: Text('Sign out'),
              onPressed: () {},
            ),
          ),
        )
      ],
    );
  }
}
