import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/sign_up/screens/email_verify_screen.dart';

import '../../sign_up/screens/sign_in_screen.dart';
import '../providers/auth.dart';
import '../screens/future_screen_template.dart';
import '../screens/tabs_router_screen.dart';

class AutoLoginInitializer extends StatelessWidget {
  const AutoLoginInitializer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureScreenTemplate(
      future: Provider.of<Auth>(context, listen: false).user == null
          ? Provider.of<Auth>(context, listen: false).autoLogin()
          : null,
      body: Consumer<Auth>(
        builder: (context, authData, child) {
          debugPrint("Auto login ran");
          var authProvider = Provider.of<Auth>(context);
          if (authProvider.isAnonymousLogin) {
            return const TabsRouterScreen();
          }
          if (authProvider.isAuth &&
              authProvider.user!.firebaseAuth.currentUser!.emailVerified) {
            return const TabsRouterScreen();
          } else {
            if (authProvider.isAuth) {
              return const EmailVerifyScreen();
            }
            return const SignInScreen();
          }
        },
      ),
    );
  }
}
