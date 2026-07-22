import 'package:flutter/material.dart';
import 'package:animal/models/scoring.dart';
import './models/mockScoring.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final Scoring mockData = MockScoring().mockScoringData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Domino Scoreboard",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Domino Scoreboard"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const SizedBox(height: 15),

            Image.asset(
              "assets/images/Domino.webp",
              height: 150,
            ),

            const SizedBox(height: 20),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: scoreList(mockData),
              ),
            ),

            const Divider(),

            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Text(
                    "Total Home Score: ${mockData.totalHomeScore}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Total Away Score: ${mockData.totalAwayScore}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget scoreList(Scoring scoreModel) {
    List<Widget> myScoresList = [];

    for (var entry in scoreModel.scores) {
      myScoresList.add(
        Card(
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Home: ${entry.home}"),
                Text("Away: ${entry.away}"),
              ],
            ),
          ),
        ),
      );
    }

    return ListView(
      children: myScoresList,
    );
  }
}
