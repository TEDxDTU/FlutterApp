import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:tedx_dtu_app/global/widgets/bottom_bar_screen_widget.dart';
import 'package:tedx_dtu_app/global/widgets/tedx_app_bar.dart';
import 'package:tedx_dtu_app/trivia/helpers/slanted_container_clipper.dart';
import '../../helpers/extensions/padding_widget_list_extension.dart';
import '../widgets/trivia_slider_panel.dart';

class TriviaScreen extends StatelessWidget {
  const TriviaScreen({Key? key}) : super(key: key);
  static const routeName = '/trivia-screen';
  @override
  Widget build(BuildContext context) {
    return BottomBarScreenWidget(
      appBarTitle: 'Trivia',
      children: [
        TriviaSliderPanel(),
        ClipPath(
          clipper: SlantedContainerClipper(),
          child: Container(
            height: 200,
            width: double.infinity,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
