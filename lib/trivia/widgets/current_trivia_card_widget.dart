import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/global/screens/future_screen_template.dart';
import 'package:tedx_dtu_app/global/screens/refreshable_future_screen_template.dart';
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
            padding: EdgeInsets.all(20),
            child: Text(
              currTrivia.title,
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
