import 'package:animal/models/scoring.dart';
import 'package:flutter/material.dart';
import './models/mockScoring.dart';

void main() {
  runApp( MainApp());
}

class MainApp extends StatelessWidget {
   MainApp({super.key});


Scoring mockData = MockScoring().mockScoringData(); 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Flexible(child:  scoreList(mockData))
             
              ],
             
          ),
        ),
      ),
    );
  }

  Widget scoreList(Scoring scoreModel){
    List<Widget> myScoresList = [];
    for (var entry in scoreModel.scores){
myScoresList.add(
  Row(
    mainAxisAlignment: .spaceEvenly,
      children: [
        Text("Home ${entry.home}"),
        Text("Away ${entry.away}")
      ],
    ));
    }
  
    return ListView(
      children: myScoresList);
  }
}
