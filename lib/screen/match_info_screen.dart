import 'package:cricket_score_app/api_service/cricket_api.dart';
import 'package:cricket_score_app/api_service/match_api_service.dart';
import 'package:cricket_score_app/screen/match_detail_screen.dart';
import 'package:flutter/material.dart';

class MatchInfoScreen extends StatefulWidget {
  const MatchInfoScreen({Key? key}) : super(key: key);

  @override
  State<MatchInfoScreen> createState() => _MatchInfoScreenState();
}

class _MatchInfoScreenState extends State<MatchInfoScreen> {
  late MatchApiResponse matchApiResponse;

  @override
  void initState() {
    super.initState();
    matchApiResponse = MatchApiResponse();
    getMatchInformation();
  }

  Future<void> getMatchInformation() async {
    matchApiResponse = await MatchApiService.getMatchInformation();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "FEATURED",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text(
                  "FEATURED",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                SizedBox(width: 130),
                Text(
                  'CRICBUZZ PLUS',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            )
          ],
        ),
        backgroundColor: Colors.blue,
        toolbarHeight: 100,
      ),
      body:  matchApiResponse == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: matchApiResponse.matchInfoList?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          var matchInfo = matchApiResponse.matchInfoList![index];
          var scoreInfo = matchApiResponse.scoreInfo;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return MatchDetailScreen(
                      matchInfo: matchInfo,
                      information: matchApiResponse.info!,
                    );
                  }),
                );
              },
              child: Card(
                child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(matchInfo.date.toString()),
                      Text(matchInfo.name.toString()),
                      Row(
                        children: [
                          Image.network(
                            matchInfo.teamInfo?[0].img ?? '--',
                            height: 50,
                          ),
                          const SizedBox(width: 10),
                          Text(matchInfo.teamInfo?[0].shortname ?? '--'),

                          Text(
                            '${scoreInfo?.r}/${scoreInfo?.w} ,(${scoreInfo?.o})',
                          ),
                          Text(scoreInfo?.inning??''),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Image.network(
                            matchInfo.teamInfo?[1].img ?? '--',
                            height: 50,
                          ),
                          const SizedBox(width: 5),
                          Text(matchInfo.teamInfo?[1].shortname ?? '--'),
                          Text(
                            '${scoreInfo?.r}./${scoreInfo?.w} ,(${scoreInfo?.o})',
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(matchInfo.status.toString()),
                          const SizedBox(height: 10),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("TABLE"),
                              SizedBox(width: 15),
                              Text('Credits'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
