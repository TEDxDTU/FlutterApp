import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/global/widgets/bottom_bar_screen_widget.dart';
import 'package:tedx_dtu_app/global/widgets/tedx_app_bar.dart';
import 'package:tedx_dtu_app/trivia/helpers/slanted_container_clipper.dart';
import 'package:tedx_dtu_app/trivia/providers/trivia_provider.dart';
import 'package:tedx_dtu_app/trivia/widgets/trivia_card_widget.dart';
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
        ...Provider.of<TriviaProvider>(context)
            .data
            .map(
              (trivia) => TriviaCardWidget(
                title: trivia.title,
                id: trivia.id,
                imageUrl: trivia.imageUrl,
                questionCount: trivia.questionCount,
                totalTime: trivia.totalTime,
              ),
            )
            .toList(),
      ],
    );
  }
}
