import 'package:dating/style/constant.dart';
import 'package:flutter/material.dart';

class FeedIcon extends StatelessWidget {
  const FeedIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.12,
          height: MediaQuery.of(context).size.width * 0.12,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45), color: Colors.grey),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '홍길동',
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '강남구 24세 185cm',
                style: TextStyle(fontSize: 10, color: font2Color),
              )
            ],
          ),
        ),
      ],
    );
  }
}
