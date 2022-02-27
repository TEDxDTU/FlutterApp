import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/global/providers/auth.dart';
import 'package:tedx_dtu_app/helpers/classes/ui_helper.dart';
import 'package:tedx_dtu_app/profile/providers/profile_inner_widget_provider.dart';
import 'package:tedx_dtu_app/profile/widgets/account_circle_with_text.dart';
import 'package:tedx_dtu_app/profile/widgets/editable_text_field.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? email;
  String? name;
  String? university;
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
              onChanged: (value) => name = value,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter a name';
                }
                return null;
              },
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
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter a university';
                }
                return null;
              },
              onChanged: (value) => university = value,
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
            //   onChanged: (value) => email = value,
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
                    onPressed: () async {
                      // await UIHelper.showSuccessDialog(context, 'test', 'msg');
                      // await UIHelper.showErrorDialog(context, 'test', 'msg');
                      if (_formKey.currentState?.validate() ?? false) {
                        try {
                          await auth.updateUser(
                            name: name,
                            email: email,
                            university: university,
                          );

                          UIHelper.showSuccessDialog(
                            context,
                            'Updated!',
                            'Profile updated successfully',
                          );
                          print(FirebaseAuth.instance.currentUser!.displayName);
                        } catch (e) {
                          UIHelper.showErrorDialog(
                            context,
                            'Error',
                            e.toString(),
                          );
                        }
                      }
                      // Provider.of<ProfileInnerWidgetProvider>(context,
                      //             listen: false)
                      //         .currentInnerWidget =
                      //     CurrentInnerWidget.mainSettings;
                    },
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
