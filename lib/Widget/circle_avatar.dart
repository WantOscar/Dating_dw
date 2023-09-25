import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.22,
          height: MediaQuery.of(context).size.width * 0.22,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60), color: Colors.grey),
        ),
        const SizedBox(
          height: 8,
        ),
        const Text(
          '홍길동',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        ),
        const Text(
          '20세',
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),
        )
      ],
    );
  }
}
