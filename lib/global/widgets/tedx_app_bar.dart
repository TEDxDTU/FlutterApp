import 'package:flutter/material.dart';

import 'package:tedx_dtu_app/helpers/widgets/blurred_widget.dart';

class TedxAppBar extends StatelessWidget implements PreferredSizeWidget {
  ///Creates a TedxAppBar, an app bar with the TedxDTU logo.
  ///The app bar animates between white12 and white background and corresponding
  ///text color on scrolling. Text color is handled by switching the image from
  ///white text logo to black text logo.
  const TedxAppBar({
    Key? key,
    required this.scrollPassed,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  ///Boolean to specify whether the user has scrolled past the app bar.
  ///If true the app bar will animate from white12 to white background.
  final bool scrollPassed;
  @override
  Widget build(BuildContext context) {
    return BlurredWidget(
      sigmaX: 7,
      sigmaY: 7,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: AppBar(
          key: ValueKey(scrollPassed),
          backgroundColor: scrollPassed ? Colors.white : Colors.white12,
          centerTitle: false,
          title: Image.asset(
            scrollPassed
                ? 'assets/images/logoBlack.png'
                : 'assets/images/logoWhite.png',
            width: 140,
          ),
        ),
      ),
    );
  }

  @override
  final Size preferredSize;
}
