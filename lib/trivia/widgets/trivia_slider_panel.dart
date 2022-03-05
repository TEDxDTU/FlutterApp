import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tedx_dtu_app/helpers/extensions/padding_widget_list_extension.dart';
import 'package:tedx_dtu_app/trivia/widgets/current_trivia_card_widget.dart';

class TriviaSliderPanel extends StatefulWidget {
  const TriviaSliderPanel({
    Key? key,
  }) : super(key: key);

  @override
  State<TriviaSliderPanel> createState() => _TriviaSliderPanelState();
}

class _TriviaSliderPanelState extends State<TriviaSliderPanel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
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
            CurrentTriviaCardWidget(),
          ].padded(padding: EdgeInsets.all(5)),
          options: CarouselOptions(
            initialPage: _currentIndex,
            pageSnapping: true,
            enableInfiniteScroll: false,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        SizedBox(
          height: 23,
          // width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 3; i++)
                AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  width: _currentIndex == i ? 12 : 8.0,
                  height: _currentIndex == i ? 12 : 8.0,
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == i
                        ? Theme.of(context).primaryColor
                        : Colors.white,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
