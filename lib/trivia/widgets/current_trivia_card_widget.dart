import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/global/screens/future_screen_template.dart';
import 'package:tedx_dtu_app/global/screens/refreshable_future_screen_template.dart';
import 'package:tedx_dtu_app/helpers/widgets/blurred_widget.dart';
import 'package:tedx_dtu_app/trivia/helpers/slanted_container_clipper.dart';
import 'package:tedx_dtu_app/trivia/models/trivia.dart';
import 'package:tedx_dtu_app/trivia/providers/trivia_provider.dart';

import 'labelled_icon.dart';

class CurrentTriviaCardWidget extends StatelessWidget {
  const CurrentTriviaCardWidget({Key? key}) : super(key: key);

  Widget _buildDivider() {
    return VerticalDivider();
  }

  @override
  Widget build(BuildContext context) {
    return FutureScreenTemplate(
      future: Provider.of<TriviaProvider>(context).fetchData()?.call(),
      body: Consumer<TriviaProvider>(
        builder: (context, triviaData, child) {
          Trivia currTrivia = triviaData.currentTrivia;
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(currTrivia.imageUrl),
                fit: BoxFit.cover,
              ),
              // color: Colors.green,
            ),
            // padding: EdgeInsets.all(20).copyWith(top: 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ClipPath(
                    clipper: SlantedContainerClipper(),
                    // size: Size(double.infinity, 100),
                    child: BlurredWidget(
                      sigmaX: 7,
                      sigmaY: 7,
                      child: Container(
                        // color: Colors.white70,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.white10,
                              Colors.white12,
                              Colors.white24,
                              Colors.white30,
                              Colors.white38,
                              Colors.white54,
                              // Colors.white70,
                            ],
                          ),
                        ),
                        // width: 100,
                        // color: Colors.red,
                        height: 66,
                        width: double.infinity,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          // mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            LabelledIcon(
                              label: '${currTrivia.questionCount} Questions',
                              icon: Icon(
                                Icons.help,
                                color: Colors.blueGrey[100],
                              ),
                            ),
                            VerticalDivider(
                              thickness: 3,
                              color: Colors.blueGrey[200],
                            ),
                            LabelledIcon(
                              label: '${currTrivia.totalTime} Time',
                              icon: Icon(
                                Icons.timer,
                                color: Colors.blueGrey[100],
                              ),
                            ),
                            VerticalDivider(
                              thickness: 3,
                              color: Colors.blueGrey[200],
                            ),
                            LabelledIcon(
                              label: '${currTrivia.questionCount * 10} Points',
                              icon: Icon(
                                Icons.emoji_events,
                                color: Colors.blueGrey[100],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Text(
                  //   currTrivia.title,
                  //   style: TextStyle(
                  //     fontSize: 28,
                  //     color: Colors.white,
                  //   ),
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
