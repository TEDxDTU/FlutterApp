import 'package:flutter/material.dart';

class TedXSliverAppBar extends StatelessWidget {
  const TedXSliverAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: false,
      title: Image.asset(
        'assets/images/logoWhite.png',
        width: 140,
      ),
    );
  }
}
