import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/global/widgets/tedx_app_bar.dart';
import 'package:tedx_dtu_app/sign_up/helpers/sign_up_image_outline_painter.dart';
import 'package:tedx_dtu_app/sign_up/helpers/sign_up_image_clipper.dart';
import 'package:tedx_dtu_app/sign_up/widgets/sign_up_image_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const routeName = '/sign-up-screen';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late String? name, email, phone;
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SignUpImageWidget(),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 10.0, right: MediaQuery.of(context).size.width * 0.2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
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
                      style: TextStyle(color: Colors.white),
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
                    Text(
                      'Mobile',
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.name,
                      decoration:
                          buildInputDecoration(Icons.phone, "Phone Number"),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter phone no ';
                        } else if (value.length < 9) {
                          return 'Please enter valid phone Number';
                        }
                        return null;
                      },
                      onSaved: (String? value) {
                        phone = value;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
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
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.text,
                      decoration:
                          buildInputDecoration(Icons.business, "University"),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your University Name';
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
                    Text(
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
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.name,
                      decoration: buildInputDecoration(Icons.email, "Email"),
                      validator: (String? value) {
                        if (value!.isEmpty) {
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
                    Text(
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
                      style: TextStyle(color: Colors.white),
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
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
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
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.name,
                      decoration:
                          buildInputDecoration(Icons.lock, "Confirm Password"),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please re-enter password';
                        }
                        if (password.text != confirmpassword.text) {
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
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Processing Data'),
                              ),
                            );
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
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration(IconData icon, String hinttext) {
    return InputDecoration(
      hintText: hinttext,
      hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
      prefixIcon: Icon(
        icon,
        color: Colors.grey,
        size: 17,
      ),
      fillColor: Colors.black,
      filled: true,
      errorStyle: TextStyle(color: Colors.white),
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
