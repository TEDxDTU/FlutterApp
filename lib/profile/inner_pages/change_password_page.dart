import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/profile/providers/profile_inner_widget_provider.dart';
import 'package:tedx_dtu_app/profile/widgets/account_circle_with_text.dart';
import 'package:tedx_dtu_app/profile/widgets/password_text_field.dart';

class ChangePasswordPage extends StatelessWidget {
  ChangePasswordPage({Key? key}) : super(key: key);
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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
                .currentInnerWidget = CurrentInnerWidget.mainSettings;
          },
        ),
        const SizedBox(height: 40),
        const AccountCircleWithText(text: 'Change Password'),
        PasswordTextField(
          label: 'Current Password',
          controller: TextEditingController(),
          keyboardType: TextInputType.name,
          validator: (String? value) {
            //TODO: Add validation with current password
            if (value!.isEmpty) {
              return 'Please Enter Password';
            } else if (value.length < 8) {
              return 'Password size is weak';
            }
            return null;
          },
        ),
        const SizedBox(
          height: 10,
        ),
        PasswordTextField(
          label: 'New Password',
          controller: _passwordController,
          keyboardType: TextInputType.name,
          validator: (String? value) {
            if (value!.isEmpty) {
              return 'Please Enter Password';
            } else if (value.length < 8) {
              return 'Password size is weak';
            }
            return null;
          },
        ),
        const SizedBox(
          height: 10,
        ),
        PasswordTextField(
          label: 'Confirm Password',
          controller: _confirmPasswordController,
          keyboardType: TextInputType.name,
          validator: (String? value) {
            if (value!.isEmpty) {
              return 'Please re-enter password';
            }
            if (_passwordController.text != _confirmPasswordController.text) {
              return "Password does not match";
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
  }
}
