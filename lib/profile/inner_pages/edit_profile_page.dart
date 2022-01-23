import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/profile/providers/profile_inner_widget_provider.dart';
import 'package:tedx_dtu_app/profile/widgets/account_circle_with_text.dart';
import 'package:tedx_dtu_app/profile/widgets/editable_text_field.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Provider.of<ProfileInnerWidgetProvider>(context, listen: false)
                  .currentInnerWidget = CurrentInnerWidget.mainSettings;
            },
          ),
          SizedBox(height: 40),
          AccountCircleWithText(text: 'Edit Profile'),
          EditableTextField(
            label: 'Name',
            initialValue: 'Satvik Gupta',
          ),
          EditableTextField(
            label: 'Phone',
            initialValue: '9910119645',
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          EditableTextField(
            label: 'University',
            initialValue: 'Delhi Technological University',
          ),
          EditableTextField(
            label: 'Email',
            initialValue: 'satvik.sli@gmail.com',
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'Email cannot be empty';
              }
              if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                  .hasMatch(val)) {
                return 'Please a valid Email';
              }
              return null;
            },
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Center(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                  ),
                  child: Text('Save'),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
