import 'package:flutter/material.dart';

class CustomPointButton extends StatelessWidget {
  const CustomPointButton({
    super.key,
    required this.points,
    required this.onAdd,
  });

  final int points;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.orange,
      padding: points == 1
          ? const EdgeInsets.symmetric(vertical: 16, horizontal: 30)
          : const EdgeInsets.symmetric(vertical: 16, horizontal: 25),
      onPressed: onAdd,
      child: Text('Add $points Point${points > 1 ? 's' : ''}'),
    );
  }
}
