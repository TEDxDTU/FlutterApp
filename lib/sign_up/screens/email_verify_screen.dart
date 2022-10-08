import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/global/providers/auth.dart';
import 'package:tedx_dtu_app/global/screens/tabs_router_screen.dart';

import '../../global/providers/globals.dart' as globals;

class EmailVerifyScreen extends StatefulWidget {
  const EmailVerifyScreen({Key? key}) : super(key: key);

  static const routeName = '/email-verify-screen';

  @override
  State<EmailVerifyScreen> createState() => _EmailVerifyScreenState();
}

class _EmailVerifyScreenState extends State<EmailVerifyScreen> {
  late final Timer _timer;

  @override
  void didChangeDependencies() {
    var auth = Provider.of<Auth>(context);

    _timer = Timer.periodic(const Duration(seconds: 5), (_) async {
      await auth.user!.firebaseAuth.currentUser!.reload();
      setState(() {
        if (auth.user!.firebaseAuth.currentUser!.emailVerified) {
          globals.snackbarKey.currentState!.showSnackBar(
            SnackBar(
              content: const Text(
                "Email verified!",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              duration: const Duration(milliseconds: 1500),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Colors.green,
            ),
          );
          Timer(const Duration(milliseconds: 1500), () {
            _timer.cancel();
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            Navigator.of(context)
                .pushReplacementNamed(TabsRouterScreen.routeName);
          });
        }
      });
    });

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    if (_timer.isActive) {
      _timer.cancel();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var auth = Provider.of<Auth>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Expanded(
              flex: 3,
              child: Lottie.asset("assets/lottie/email_verification.json"),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  const Text(
                    "Confirm Your email address",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "We have sent a confirmation email to :",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    auth.user!.email,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Check your email and click on the\n confirmation link to continue.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () async {
                await auth.user!.firebaseAuth.currentUser!
                    .sendEmailVerification();

                globals.snackbarKey.currentState!.showSnackBar(
                  SnackBar(
                    content: const Text(
                      "Verification email sent!",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    duration: const Duration(milliseconds: 2000),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              child: Container(
                height: 60,
                width: double.infinity,
                color: Theme.of(context).primaryColor,
                child: const Center(
                  child: Text(
                    "Resend verification email",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
