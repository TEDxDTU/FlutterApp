import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/global/screens/future_screen_template.dart';
import 'package:tedx_dtu_app/global/screens/refreshable_future_screen_template.dart';
import 'package:tedx_dtu_app/global/widgets/custom_image_widget.dart';
import 'package:tedx_dtu_app/helpers/widgets/blurred_widget.dart';
import 'package:tedx_dtu_app/trivia/helpers/slanted_container_clipper.dart';
import 'package:tedx_dtu_app/trivia/models/trivia.dart';
import 'package:tedx_dtu_app/trivia/providers/trivia_provider.dart';

import 'labelled_icon.dart';
import 'trivia_details_row_widget.dart';

class CurrentTriviaCardWidget extends StatelessWidget {
  const CurrentTriviaCardWidget({Key? key}) : super(key: key);
  static const gradientColorsList = [
    Colors.transparent,
    // Colors.transparent,
    Colors.transparent,
    Color.fromARGB(8, 255, 255, 255),
    Color.fromARGB(10, 255, 255, 255),
    Color.fromARGB(15, 255, 255, 255),
    Colors.white10,
    Colors.white12,
    Colors.white24,
    Colors.white30,
    Colors.white38,
    Colors.white54,
    // Colors.white70,
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<TriviaProvider>(
      builder: (context, triviaData, child) {
        Trivia currTrivia = triviaData.currentTrivia;

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // image: DecorationImage(
            //   image: NetworkImage(currTrivia.imageUrl),
            //   fit: BoxFit.cover,
            // ),
            // color: Colors.green,
          ),
          // padding: EdgeInsets.all(20).copyWith(top: 0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomImageWidget(url: currTrivia.imageUrl),
                Positioned(
                  right: 0,
                  left: 0,
                  top: 0,
                  child: ClipPath(
                    clipper: SlantedContainerClipper(),
                    // size: Size(double.infinity, 100),
                    child: BlurredWidget(
                      sigmaX: 7,
                      sigmaY: 7,
                      child: Container(
                        // color: Colors.white70,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: gradientColorsList,
                          ),
                        ),
                        // width: 100,
                        // color: Colors.red,
                        height: 66,
                        // width: double.infinity,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.all(8),
                        child: TriviaDetailsRowWidget(
                          questionCount: currTrivia.questionCount,
                          totalTime: currTrivia.totalTime,
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 150,
                        child: Text(
                          'This week\'s trivia is on',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontFamily: 'DM_Serif_Text'
                              // fontWeight:
                              ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        currTrivia.title.toUpperCase(),
                        style: TextStyle(
                          shadows: [
                            Shadow(
                              color: Colors.grey[700]!,
                              // blurRadius: 10,
                              offset: Offset(-4, -3),
                            ),
                          ],
                          color: Colors.white,
                          fontSize: 33,
                          fontFamily: 'Heebo',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  // right: 0,
                  child: RotatedBox(
                    quarterTurns: 2,
                    child: ClipPath(
                      clipper: SlantedContainerClipper(),
                      child: Container(
                        // color: Colors.red,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: gradientColorsList..reversed,
                          ),
                        ),
                        height: 75,
                        width: 450,
                        // width: double.infinity,
                        // alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 250, right: 8),
                        child: RotatedBox(
                          quarterTurns: 2,
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/trivia/stars.png',
                                    height: 30,
                                    fit: BoxFit.cover,
                                  ),
                                  // SizedBox(height: 5),
                                  Image.asset(
                                    'assets/trivia/win.png',
                                    // width: 100,
                                    height: 30,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                              SizedBox(width: 10),
                              Flexible(
                                child: Text(
                                  'for a chance at free tickets and top our leaderboard',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontFamily: 'DM_Serif_Text',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
