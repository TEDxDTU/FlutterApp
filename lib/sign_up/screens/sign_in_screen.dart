import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/global/providers/auth.dart';
import 'package:tedx_dtu_app/helpers/classes/ui_helper.dart';
import 'package:tedx_dtu_app/home/screens/tabs_screen.dart';
import 'package:tedx_dtu_app/sign_up/helpers/sign_up_background_painter.dart';
import 'package:tedx_dtu_app/sign_up/screens/sign_up_screen.dart';
import 'package:tedx_dtu_app/sign_up/widgets/sign_up_image_widget.dart';
import 'package:tedx_dtu_app/sign_up/widgets/user_image_picker.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);
  static const routeName = '/sign-up-screen';
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String? email;
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign In',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Image.asset(
            'assets/images/logoWhite.png',
            height: kToolbarHeight,
            width: 120,
          ),
          const SizedBox(
            width: 10,
          ),
        ],
        centerTitle: false,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 10.0,
                right: MediaQuery.of(context).size.width * 0.2,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                    decoration: buildInputDecoration(Icons.email, "Email"),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Email';
                      }
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return 'Please a valid Email';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      email = value;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.name,
                    decoration: buildInputDecoration(Icons.lock, "Password"),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Password';
                      } else if (value.length < 8) {
                        return 'Password size is weak';
                      }
                      return null;
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () async {
                        print("sign in button pressed");
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          try {
                            await Provider.of<Auth>(context, listen: false)
                                .signIn(
                              email: email!,
                              password: passwordController.text,
                            );
                          } on Exception catch (e) {
                            UIHelper.showErrorDialog(
                              context,
                              'Error',
                              e.toString().replaceAll('Exception:', '').trim(),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                          onPrimary: Colors.white,
                          primary: Colors.red,
                          elevation: 4),
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: const SizedBox(height: 10)),
            Center(
              child: TextButton(
                onPressed: () async {
                  Provider.of<Auth>(context, listen: false).loginAnon();
                },
                child: const Text(
                  'Continue as guest',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () async {
                  Navigator.of(context).pushNamed(SignUpScreen.routeName);
                },
                child: const Text(
                  'Don\'t have an account? Sign up',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration(IconData icon, String hinttext) {
    return InputDecoration(
      hintText: hinttext,
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
      prefixIcon: Icon(
        icon,
        color: Colors.grey,
        size: 17,
      ),
      fillColor: Colors.black.withOpacity(0.8),
      filled: true,
      errorStyle: const TextStyle(color: CupertinoColors.destructiveRed),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1.5,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          color: Colors.white,
          width: 1.5,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          color: Colors.white,
          width: 1.5,
        ),
      ),
    );
  }
}
