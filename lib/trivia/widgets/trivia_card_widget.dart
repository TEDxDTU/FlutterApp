import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/global/providers/auth.dart';
import 'package:tedx_dtu_app/global/widgets/custom_image_widget.dart';
import 'package:tedx_dtu_app/global/widgets/signup_alertdialog.dart';
import 'package:tedx_dtu_app/helpers/classes/ui_helper.dart';
import 'package:tedx_dtu_app/home/screens/no_bottombar_screen.dart';
import 'package:tedx_dtu_app/trivia/screens/trivia_attempt_screen.dart';
import 'package:tedx_dtu_app/trivia/screens/trivia_welcome_screen.dart';

import 'package:tedx_dtu_app/trivia/widgets/trivia_details_row_widget.dart';

import '../providers/trivia_provider.dart';

class TriviaCardWidget extends StatelessWidget {
  const TriviaCardWidget({
    Key? key,
    required this.title,
    required this.id,
    required this.imageUrl,
    required this.questionCount,
    required this.totalTime,
    required this.hasAttempted,
  }) : super(key: key);
  final String title;
  final String id;
  final String imageUrl;
  final int questionCount;
  final int totalTime;
  final bool hasAttempted;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        // image: DecorationImage(
        //   image: NetworkImage(imageUrl),
        //   fit: BoxFit.cover,

        // ),
        border: Border.all(
          color: Colors.grey,
        ),
        // color: Colors.red,
      ),
      width: double.infinity,
      height: 190,
      margin: const EdgeInsets.all(15),
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          // Custom
          children: [
            CustomImageWidget(url: imageUrl),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.red.withOpacity(0.05),
                    Colors.red.withOpacity(0.1),
                    Colors.red.withOpacity(0.2),
                    Colors.red.withOpacity(0.3),
                    Colors.red.withOpacity(0.5),
                    Colors.red.withOpacity(0.7),
                    Colors.red,
                  ],
                ),
              ),
              alignment: Alignment.bottomLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    // flex: 0,
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.headline2?.copyWith(
                            fontSize: 22,
                          ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        TriviaDetailsRowWidget(
                          questionCount: questionCount,
                          totalTime: totalTime,
                          // width: double.infinity,
                          // dividerColor: Colors.black,
                          // iconColor: Colors.black,
                          // textColor: Colors.black,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              primary:
                                  hasAttempted ? Colors.grey : Colors.black,
                            ),
                            onPressed: () async {
                              if (!Provider.of<Auth>(context, listen: false)
                                  .isAuth) {
                                // UIHelper.showErrorDialog(context, 'Sign in',
                                //     'You must be signed in to play trivia');
                                // return;
                                showDialog(
                                    context: context,
                                    builder: (context) => SignUpAlertDialog(
                                        description:
                                            'You must be signed in to play trivia'));
                                return;
                              }
                              // ONLY FOR TESTING PURPOSES RIGHT NOW
                              if (hasAttempted) {
                                UIHelper.showErrorDialog(
                                  context,
                                  'Already played!',
                                  'Sorry!\n\nYou have already played this trivia',
                                );
                                return;
                              }
                              Navigator.of(context).pushNamed(
                                  NoBottomBarScreen.routeName,
                                  arguments: {
                                    'child': const TriviaWelcomeScreen(),
                                    'id': id,
                                  });
                            },
                            child: FittedBox(
                                child: Text(
                                    hasAttempted ? 'Played!' : 'Play Now')),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
