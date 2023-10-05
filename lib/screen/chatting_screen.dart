import 'package:dating/Widget/chatting_box.dart';
import 'package:dating/Widget/chatting_container.dart';
import 'package:dating/constant.dart';
import 'package:flutter/material.dart';

class ChattingScreen extends StatelessWidget {
  const ChattingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            '채팅',
            style: TextStyle(
                fontSize: 25, color: fontColor, fontWeight: FontWeight.bold),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              Icons.more_horiz,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ChattingContainer(),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: List.generate(
                50,
                (index) => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: ChattingBox(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
