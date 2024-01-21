import 'package:dating/Widget/alarm/alarm_widget.dart';
import 'package:dating/Widget/icon_header.dart';
import 'package:flutter/material.dart';

class AlarmScreen extends StatelessWidget {
  const AlarmScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: IconHeader(text: '알림'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AlarmWidget(
              text: Text(
                '홍길동',
                style: TextStyle(fontSize: 17),
              ),
              text2: Text(
                '나에게 하트를 눌렀어요! 마음에 드시나요?',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              text3: Text(
                '1시간전',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ),
            AlarmWidget(
              text: Text(
                '남동길',
                style: TextStyle(fontSize: 17),
              ),
              text2: Text(
                '나에게 채팅을 보냈네요?"안녕하세요? 뭐하고 계세 \n요?"',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              text3: Text(
                '2시간전',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ),
            AlarmWidget(
              text: Text(
                '홍길동',
                style: TextStyle(fontSize: 17),
              ),
              text2: Text(
                '나에게 하트를 눌렀어요! 마음에 드시나요?',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              text3: Text(
                '10월 13일',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ),
            AlarmWidget(
              text: Text(
                '남동길',
                style: TextStyle(fontSize: 17),
              ),
              text2: Text(
                '나에게 채팅을 보냈네요?"안녕하세요? 뭐하고 계세 \n요?"',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              text3: Text(
                '10월 13일',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ),
            AlarmWidget(
              text: Text(
                '홍길동',
                style: TextStyle(fontSize: 17),
              ),
              text2: Text(
                '나에게 하트를 눌렀어요! 마음에 드시나요?',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              text3: Text(
                '10월 13일',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ),
            AlarmWidget(
              text: Text(
                '남동길',
                style: TextStyle(fontSize: 17),
              ),
              text2: Text(
                '나에게 채팅을 보냈네요?"안녕하세요? 뭐하고 계세 \n요?"',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              text3: Text(
                '10월 14일',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
