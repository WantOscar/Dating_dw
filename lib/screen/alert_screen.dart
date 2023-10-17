import 'package:dating/style/constant.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            '알림',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: fontColor),
          ),
        ),
        leadingWidth: 200,
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            AlertWidget(
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
            AlertWidget(
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
            AlertWidget(
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
            AlertWidget(
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
            AlertWidget(
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
            AlertWidget(
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
            AlertWidget(
              text: Text(
                '홍길동',
                style: TextStyle(fontSize: 17),
              ),
              text2: Text(
                '나에게 하트를 눌렀어요! 마음에 드시나요?',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              text3: Text(
                '10월 14일',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ),
            AlertWidget(
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
            AlertWidget(
              text: Text(
                '홍길동',
                style: TextStyle(fontSize: 17),
              ),
              text2: Text(
                '나에게 하트를 눌렀어요! 마음에 드시나요?',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              text3: Text(
                '10월 17일',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ),
            AlertWidget(
              text: Text(
                '남동길',
                style: TextStyle(fontSize: 17),
              ),
              text2: Text(
                '나에게 채팅을 보냈네요?"안녕하세요? 뭐하고 계세 \n요?"',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              text3: Text(
                '10월 17일',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ),
            AlertWidget(
              text: Text(
                '홍길동',
                style: TextStyle(fontSize: 17),
              ),
              text2: Text(
                '나에게 하트를 눌렀어요! 마음에 드시나요?',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              text3: Text(
                '10월 17일',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ),
            AlertWidget(
              text: Text(
                '남동길',
                style: TextStyle(fontSize: 17),
              ),
              text2: Text(
                '나에게 채팅을 보냈네요?"안녕하세요? 뭐하고 계세 \n요?"',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              text3: Text(
                '10월 15일',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ),
            AlertWidget(
              text: Text(
                '홍길동',
                style: TextStyle(fontSize: 17),
              ),
              text2: Text(
                '나에게 하트를 눌렀어요! 마음에 드시나요?',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              text3: Text(
                '10월 15일',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ),
            AlertWidget(
              text: Text(
                '남동길',
                style: TextStyle(fontSize: 17),
              ),
              text2: Text(
                '나에게 채팅을 보냈네요?"안녕하세요? 뭐하고 계세 \n요?"',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              text3: Text(
                '10월 15일',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ),
            AlertWidget(
              text: Text(
                '홍길동',
                style: TextStyle(fontSize: 17),
              ),
              text2: Text(
                '나에게 하트를 눌렀어요! 마음에 드시나요?',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              text3: Text(
                '10월 18일',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ),
            AlertWidget(
              text: Text(
                '남동길',
                style: TextStyle(fontSize: 17),
              ),
              text2: Text(
                '나에게 채팅을 보냈네요?"안녕하세요? 뭐하고 계세 \n요?"',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              text3: Text(
                '10월 18일',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AlertWidget extends StatelessWidget {
  final Text text;
  final Text text2;
  final Text text3;
  const AlertWidget({
    super.key,
    required this.text,
    required this.text2,
    required this.text3,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.13,
                height: MediaQuery.of(context).size.width * 0.13,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    color: Colors.grey),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text,
                  const SizedBox(
                    height: 4,
                  ),
                  text2,
                ],
              ),
            ],
          ),
          text3
        ],
      ),
    );
  }
}
