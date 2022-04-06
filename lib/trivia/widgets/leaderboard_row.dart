import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tedx_dtu_app/global/screens/future_screen_template.dart';
import 'package:tedx_dtu_app/global/widgets/custom_image_widget.dart';
import 'package:tedx_dtu_app/trivia/providers/leaderboard_provider.dart';

import '../../global/widgets/refresh_button.dart';

class LeaderboardRow extends StatelessWidget {
  const LeaderboardRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<LeaderboardProvider>(context).fetchData()?.call(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox(
              height: 110,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (snapshot.hasError) {
            print(snapshot.error);
            return Text(snapshot.error.toString());
          }
          return Consumer<LeaderboardProvider>(
            builder: (context, leaderboardProvider, _) {
              return Column(
                children: [
                  RefreshButton(
                    onPressed: () async {
                      await Provider.of<LeaderboardProvider>(context,
                              listen: false)
                          .fetchData(true)
                          ?.call();
                    },
                  ),
                  SizedBox(
                    height: 110,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: leaderboardProvider.length,
                      physics: BouncingScrollPhysics(),
                      // primary: ,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 115,
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Column(
                            children: [
                              Stack(children: [
                                CircleAvatar(
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  radius: 40,
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: ClipOval(
                                      child: CustomImageWidget(
                                        url: leaderboardProvider
                                            .data[index].imageUrl,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 1,
                                  left: 1,
                                  child: Container(
                                    width: 22,
                                    height: 22,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2,
                                      ),
                                      color: Theme.of(context).primaryColor,
                                      // color: Colors.black,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Center(
                                      child: Text(
                                        (index + 1).toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                              const SizedBox(height: 5),
                              Text(
                                leaderboardProvider.data[index].name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              // const SizedBox(height: 5),
                              // Text(leaderboardProvider.data[index].points
                              //     .toString()),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          );
        });
  }
}
