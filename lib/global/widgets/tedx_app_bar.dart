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
    this.title,
    this.showTedxLogo = true,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  ///Boolean to specify whether the user has scrolled past the app bar.
  ///If true the app bar will animate from white12 to white background.
  final bool scrollPassed;

  /// The title of the app bar.
  final String? title;

  /// Whether to show TEDxDTU logo in the app bar
  final bool showTedxLogo;
  @override
  Widget build(BuildContext context) {
    return BlurredWidget(
      sigmaX: 7,
      sigmaY: 7,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: AppBar(
          iconTheme: IconThemeData(
            color: (scrollPassed) ? Colors.black : Colors.white,
          ),
          elevation: 8,
          shadowColor: scrollPassed ? Colors.black : Colors.transparent,
          key: ValueKey(scrollPassed),
          backgroundColor: scrollPassed ? Colors.blueGrey[50] : Colors.black,
          title: showTedxLogo
              ? Row(
                  children: [
                    Image.asset(
                      scrollPassed
                          ? 'assets/images/logoBlack.png'
                          : 'assets/images/logoWhite.png',
                      width: 140,
                    ),
                    if (title != null) SizedBox(width: 10),
                    if (title != null)
                      Text(
                        title!,
                        style: TextStyle(
                          color: (scrollPassed) ? Colors.black : Colors.white,
                        ),
                      ),
                  ],
                )
              : Text(
                  title ?? '',
                  style: TextStyle(
                    color: (scrollPassed) ? Colors.black : Colors.white,
                  ),
                ),
        ),
      ),
    );
  }

  @override
  final Size preferredSize;
}
