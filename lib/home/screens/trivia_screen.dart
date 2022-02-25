import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:tedx_dtu_app/global/widgets/bottom_bar_screen_widget.dart';
import 'package:tedx_dtu_app/global/widgets/tedx_app_bar.dart';
import '../../helpers/extensions/padding_widget_list_extension.dart';

class TriviaScreen extends StatelessWidget {
  const TriviaScreen({Key? key}) : super(key: key);
  static const routeName = '/trivia-screen';
  @override
  Widget build(BuildContext context) {
    return BottomBarScreenWidget(
      appBarTitle: 'Trivia',
      children: [
        CarouselSlider(
          items: [
            Image.asset(
              'assets/trivia/trivia_horizontal.png',
              width: double.infinity,
              // height: 300,
              // fit: BoxFit.cover,
            ),
            Image.asset(
              'assets/trivia/weekly_trivia_card.png',
              width: double.infinity,
              // height: 300,
              // fit: BoxFit.cover,
            ),
          ].padded(padding: EdgeInsets.all(5)),
          options: CarouselOptions(
            pageSnapping: true,
            enableInfiniteScroll: false,
            viewportFraction: 1,
          ),
        ),
      ],
    );
  }
}
