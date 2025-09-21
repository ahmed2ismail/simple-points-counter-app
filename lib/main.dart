import 'package:flutter/material.dart';

void main() {
  runApp(PointsCounter());
}

class PointsCounter extends StatefulWidget {
  PointsCounter({super.key});

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
      theme: ThemeData(appBarTheme: const AppBarTheme(color: Colors.orange)),
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
                Column(
                  spacing: 20,
                  children: [
                    Text("Team A", style: TextStyle(fontSize: 30)),
                    Text("$counterA", style: TextStyle(fontSize: 150)),
                    MaterialButton(
                      color: Colors.orange,
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 25,
                      ),
                      onPressed: () {
                        setState(() {
                          counterA++;
                        });
                      },
                      child: Text("Add 1 Point"),
                    ),
                    MaterialButton(
                      color: Colors.orange,
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 25,
                      ),
                      onPressed: () {
                        setState(() {
                          counterA = counterA + 2;
                        });
                      },
                      child: Text("Add 2 Point"),
                    ),
                    MaterialButton(
                      color: Colors.orange,
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 25,
                      ),
                      onPressed: () {
                        setState(() {
                          counterA = counterA + 3;
                        });
                      },
                      child: Text("Add 3 Point"),
                    ),
                  ],
                ),
                Container(
                  height: 430,
                  width: 16,
                  margin: EdgeInsets.only(top: 20),
                  child: VerticalDivider(color: Colors.grey[400], thickness: 1),
                ),
                Column(
                  spacing: 20,
                  children: [
                    Text("Team B", style: TextStyle(fontSize: 30)),
                    Text("$counterB", style: TextStyle(fontSize: 150)),
                    MaterialButton(
                      color: Colors.orange,
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 25,
                      ),
                      onPressed: () {
                        setState(() {
                          counterB++;
                        });
                      },
                      child: Text("Add 1 Point"),
                    ),
                    MaterialButton(
                      color: Colors.orange,
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 25,
                      ),
                      onPressed: () {
                        setState(() {
                          counterB = counterB + 2;
                        });
                      },
                      child: Text("Add 2 Point"),
                    ),
                    MaterialButton(
                      color: Colors.orange,
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 25,
                      ),
                      onPressed: () {
                        setState(() {
                          counterB = counterB + 3;
                        });
                      },
                      child: Text("Add 3 Point"),
                    ),
                  ],
                ),
              ],
            ),
            MaterialButton(
              color: Colors.orange,
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
              onPressed: () {
                setState(() {
                  counterA = 0;
                  counterB = 0;
                });
              },
              child: Text("Reset"),
            ),
          ],
        ),
      ),
    );
  }
}
