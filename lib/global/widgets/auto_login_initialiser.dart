import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        // stream: null,
        builder: (context, authData, child) {
          // if (authState.connectionState == ConnectionState.waiting) {
          //   print("auth waiting");
          //   return const Center(child: TedxLoadingSpinner());
          // }
          return !(Provider.of<Auth>(context).isAnonymousLogin ||
                  (Provider.of<Auth>(context).isAuth))
              ? const SignInScreen()
              : const TabsRouterScreen();
        },
      ),
    );
  }
}
