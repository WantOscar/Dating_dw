import 'package:dating/Widget/main/mbti_card.dart';
import 'package:flutter/material.dart';

class MbtiRecommend extends StatelessWidget {
  const MbtiRecommend({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'MBTI 별 추전조합',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'ISFP와 좋은 궁합을 가진 친구들이에요!',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFFbebebe),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: List.generate(
              5,
              (index) => const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: MBTICard(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
