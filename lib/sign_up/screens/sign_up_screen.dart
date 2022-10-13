import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/global/providers/auth.dart';
import 'package:tedx_dtu_app/helpers/classes/ui_helper.dart';
import 'package:tedx_dtu_app/sign_up/helpers/sign_up_background_painter.dart';
import 'package:tedx_dtu_app/sign_up/widgets/sign_up_image_widget.dart';
import 'package:tedx_dtu_app/sign_up/widgets/user_image_picker.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const routeName = '/sign-up-screen';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? name, email, phone, university;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  File? image;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Account',
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
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned.fill(
                child: CustomPaint(
                  painter: SignUpBackgroundPainter(),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const SignUpImageWidget(),
                      UserImagePicker(onSelectImage: (file) {
                        setState(() {
                          image = file;
                        });
                      }),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 10.0,
                        right: MediaQuery.of(context).size.width * 0.2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Name',
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
                          keyboardType: TextInputType.text,
                          decoration:
                              buildInputDecoration(Icons.person, 'Full Name'),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Name';
                            }
                            return null;
                          },
                          onSaved: (String? value) {
                            name = value;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'University',
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
                          keyboardType: TextInputType.text,
                          decoration: buildInputDecoration(
                              Icons.business, "University"),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your University Name';
                            }
                            return null;
                          },
                          onSaved: (String? value) {
                            university = value;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
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
                          decoration:
                              buildInputDecoration(Icons.email, "Email"),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Email';
                            }
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
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
                          decoration:
                              buildInputDecoration(Icons.lock, "Password"),
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
                        const Text(
                          'Confirm Password',
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
                          controller: confirmPasswordController,
                          style: const TextStyle(color: Colors.white),
                          obscureText: true,
                          keyboardType: TextInputType.name,
                          decoration: buildInputDecoration(
                              Icons.lock, "Confirm Password"),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please re-enter password';
                            }
                            if (passwordController.text !=
                                confirmPasswordController.text) {
                              return "Password does not match";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (image == null) {
                                UIHelper.showErrorDialog(
                                  context,
                                  'Error',
                                  'Please upload a profile picture.',
                                );
                                return;
                              }
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                try {
                                  UIHelper.showSpinnerDialog(context);
                                  await Provider.of<Auth>(context,
                                          listen: false)
                                      .signUp(
                                    email: email!.trim(),
                                    password: passwordController.text,
                                    image: image!,
                                    name: name!,
                                    university: university!,
                                  );
                                  Navigator.of(context).pop();
                                } on Exception catch (e) {
                                  UIHelper.showErrorDialog(
                                    context,
                                    'Error',
                                    e
                                        .toString()
                                        .replaceAll('Exception:', '')
                                        .trim(),
                                  );
                                } finally {
                                  UIHelper.removeSpinnerDialog(context);
                                  // Navigator.of(context).pop();
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
                              'Sign Up',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(height: 117),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
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
