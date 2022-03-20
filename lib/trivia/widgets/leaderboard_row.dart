import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tedx_dtu_app/global/screens/future_screen_template.dart';
import 'package:tedx_dtu_app/trivia/providers/leaderboard_provider.dart';

class LeaderboardRow extends StatelessWidget {
  const LeaderboardRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<LeaderboardProvider>(context).fetchData()?.call(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            print(snapshot.error);
            return Text(snapshot.error.toString());
          }
          return Consumer<LeaderboardProvider>(
            builder: (context, leaderboardProvider, _) {
              return SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: leaderboardProvider.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            leaderboardProvider.data[index].imageUrl,
                          ),
                        ),
                        Column(
                          children: [
                            Text(leaderboardProvider.data[index].name),
                            Text(leaderboardProvider.data[index].points
                                .toString()),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              );
            },
          );
        });
  }
}
