import 'package:basketball_points_counter_app/widgets/team_score_column.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const PointsCounter());
}

class PointsCounter extends StatefulWidget {
  const PointsCounter({super.key});

  @override
  State<PointsCounter> createState() => _PointsCounterState();
}

class _PointsCounterState extends State<PointsCounter> {
  int counterA = 0;

  int counterB = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.orange),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Points Counter",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          spacing: 70,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TeamScoreColumn(
                  teamName: "Team A",
                  counter: counterA,
                  onAddPoints: (points) => setState(() => counterA += points),
                ),
                Container(
                  height: 430,
                  width: 16,
                  margin: const EdgeInsets.only(top: 20),
                  child: VerticalDivider(color: Colors.grey[400], thickness: 1),
                ),
                TeamScoreColumn(
                  teamName: "Team B",
                  counter: counterB,
                  onAddPoints: (points) => setState(() => counterB += points),
                ),
              ],
            ),
            MaterialButton(
              color: Colors.orange,
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
              onPressed: () {
                setState(() {
                  counterA = 0;
                  counterB = 0;
                });
              },
              child: const Text("Reset"),
            ),
          ],
        ),
      ),
    );
  }
}