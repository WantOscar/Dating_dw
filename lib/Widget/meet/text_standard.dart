import 'package:flutter/material.dart';

class TextStandard extends StatelessWidget {
  final String text;
  final double s;
  final Color color;
  const TextStandard(
      {super.key, required this.text, required this.s, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: s,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
