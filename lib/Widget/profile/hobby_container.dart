import 'dart:math';

import 'package:flutter/material.dart';

class HobbyContainer extends StatelessWidget {
  final String text;

  const HobbyContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.12,
      height: MediaQuery.of(context).size.height * 0.03,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.primaries[Random().nextInt(Colors.primaries.length)]),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          height: 1.6,
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
