import 'package:flutter/material.dart';

class ChattingContainer extends StatelessWidget {
  const ChattingContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.width * 0.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: const Color(0xFFE6E6E6),
          ),
          child: const Center(
            child: Text('단체'),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.width * 0.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: const Color(0xFFFFE1ED),
          ),
          child: const Center(
            child: Text(
              '개인',
              style: TextStyle(color: Color(0xFFFF006B)),
            ),
          ),
        ),
      ],
    );
  }
}
