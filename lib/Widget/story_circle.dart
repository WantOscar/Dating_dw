import 'package:dating/constant.dart';
import 'package:flutter/material.dart';

class StoryCircle extends StatelessWidget {
  const StoryCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.18,
          height: MediaQuery.of(context).size.width * 0.18,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              color: containerColor,
              boxShadow: const [
                BoxShadow(
                    color: Color(0xFFFF75D0), spreadRadius: 1, blurRadius: 8)
              ]),
        ),
        const SizedBox(
          height: 8,
        ),
        const Text(
          "내 스토리",
          style: TextStyle(fontSize: 12, color: font2Color),
        )
      ],
    );
  }
}
