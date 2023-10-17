import 'package:flutter/material.dart';

class HobbyContainer extends StatelessWidget {
  final String text;
  final Color color;
  const HobbyContainer({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.12,
      height: MediaQuery.of(context).size.height * 0.03,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: color,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          height: 1.6,
          color: Colors.black,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
