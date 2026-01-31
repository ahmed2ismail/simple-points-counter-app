import 'package:flutter/material.dart';
import 'custom_point_button.dart';

class TeamScoreColumn extends StatelessWidget {
  const TeamScoreColumn({
    super.key,
    required this.teamName,
    required this.counter,
    required this.onAddPoints,
  });

  final String teamName;
  final int counter;
  final void Function(int) onAddPoints;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        spacing: 20,
        children: [
          Text(teamName, style: const TextStyle(fontSize: 30)),
          FittedBox(
            child: Text("$counter", style: const TextStyle(fontSize: 150)),
          ),
          CustomPointButton(points: 1, onAdd: () => onAddPoints(1)),
          CustomPointButton(points: 2, onAdd: () => onAddPoints(2)),
          CustomPointButton(points: 3, onAdd: () => onAddPoints(3)),
        ],
      ),
    );
  }
}
