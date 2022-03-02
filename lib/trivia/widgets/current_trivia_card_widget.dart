import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/global/screens/future_screen_template.dart';
import 'package:tedx_dtu_app/global/screens/refreshable_future_screen_template.dart';
import 'package:tedx_dtu_app/trivia/helpers/slanted_container_painter.dart';
import 'package:tedx_dtu_app/trivia/models/trivia.dart';
import 'package:tedx_dtu_app/trivia/providers/trivia_provider.dart';

class CurrentTriviaCardWidget extends StatelessWidget {
  const CurrentTriviaCardWidget({Key? key}) : super(key: key);

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
            ),
            padding: EdgeInsets.all(20).copyWith(top: 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Column(
                children: [
                  CustomPaint(
                    painter: SlantedContainerPainter(),
                    // size: Size(double.infinity, 100),
                    child: Container(
                      // color: Colors.white70,
                      width: double.infinity,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            currTrivia.questionCount.toString(),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                          SizedBox(width: 50),
                          Text(
                            currTrivia.totalTime.toString(),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    currTrivia.title,
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
