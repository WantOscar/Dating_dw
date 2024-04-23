import 'package:dating/widget/common_header.dart';
import 'package:flutter/material.dart';

class AlarmScreen extends StatelessWidget {
  const AlarmScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonHeader(text: '알림'),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            10,
            (index) => const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child:
                        SizedBox(width: 60, height: 60, child: CircleAvatar()),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "홍길동",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black87,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "안녕하세요 !",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "9시간 전",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
