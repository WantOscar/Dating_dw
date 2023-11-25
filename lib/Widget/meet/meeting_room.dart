import 'package:dating/Widget/meet/meeting_container.dart';
import 'package:flutter/material.dart';

class MeetingRoom extends StatelessWidget {
  const MeetingRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: List.generate(
            50,
            (index) => const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: MeetingContainer(),
            ),
          ),
        ),
        Column(
          children: List.generate(
            50,
            (index) => const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: MeetingContainer(),
            ),
          ),
        ),
      ],
    );
  }
}
