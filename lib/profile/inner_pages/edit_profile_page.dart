import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/global/providers/auth.dart';
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
      child: Consumer<Auth>(builder: (context, auth, child) {
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
                    .currentInnerWidget = CurrentInnerWidget.mainSettings;
              },
            ),
            const SizedBox(height: 40),
            const AccountCircleWithText(text: 'Edit Profile'),
            EditableTextField(
              label: 'Name',
              initialValue: auth.user!.name,
            ),
            // EditableTextField(
            //   label: 'Phone',
            //   initialValue: '9910119645',
            //   keyboardType: TextInputType.number,
            //   inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            // ),
            EditableTextField(
              label: 'University',
              initialValue: auth.user!.university,
            ),
            // EditableTextField(
            //   label: 'Email',
            //   initialValue: auth.user!.email,
            //   validator: (val) {
            //     if (val == null || val.isEmpty) {
            //       return 'Email cannot be empty';
            //     }
            //     if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
            //         .hasMatch(val)) {
            //       return 'Please a valid Email';
            //     }
            //     return null;
            //   },
            // ),
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                    ),
                    child: const Text('Save'),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
