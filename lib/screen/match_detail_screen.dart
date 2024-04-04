import 'package:cricket_score_app/model/info_model.dart';
import 'package:cricket_score_app/model/score_info.dart';
import 'package:flutter/material.dart';

class MatchDetailScreen extends StatelessWidget {
  final ScoreInformation? information;
  final MatchInfo matchInfo;

  const MatchDetailScreen({
    Key? key,
    required this.information,
    required this.matchInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(matchInfo.teamInfo![0].shortname.toString()),
            const SizedBox(
              width: 7,
            ),
            Text(matchInfo.teamInfo![1].shortname.toString()),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
              'INFO',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const Divider(),
              const SizedBox(
                height: 16,
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(),
                  child: Row(
                    children: [
                      const Text("Match Type"),
                      const Spacer(),
                      Text(matchInfo.matchType.toString()),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const Text("Date"),
                  const Spacer(),
                  Text(matchInfo.date.toString()),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const Text("Time"),
                  const Spacer(),
                  Text(matchInfo.dateTimeGMT.toString()),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const Text("Venue"),
                  const Spacer(),
                  Flexible(child: Text(matchInfo.venue.toString())),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      const Text('History'),
                      const Spacer(),
                      Text(information!.hitsToday.toString()),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Text('Query Time'),
                      const Spacer(),
                      Text(information!.queryTime.toString()),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Text('Hits Limit'),
                      const Spacer(),
                      Text(information!.hitsLimit.toString()),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Text('cache'),
                      const Spacer(),
                      Text(information!.cache.toString()),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Text('Credits'),
                      const Spacer(),
                      Text(information!.credits.toString()),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Text('Hits Today'),
                      const Spacer(),
                      Text(information!.hitsToday.toString()),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Text("Sever"),
                      const Spacer(),
                      Text(information!.server.toString()),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Text("Total Rows"),
                      const Spacer(),
                      Text(information!.totalRows.toString()),
                    ],
                  ),


                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
