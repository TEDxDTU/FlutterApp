import 'dart:async';

import 'package:flutter/material.dart';
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
            const Text("Please verify your email"),
            ElevatedButton(
              child: const Text("Resend verification email"),
              onPressed: () async {
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
            ),
          ],
        ),
      ),
    );
  }
}
