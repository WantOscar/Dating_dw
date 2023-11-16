import 'package:dating/Widget/chat/chat.dart';
import 'package:dating/Widget/chat/chat_in/bottom_input.dart';
import 'package:dating/Widget/chat/chatting_profile.dart';
import 'package:dating/style/constant.dart';
import 'package:dating/style/icon_shape.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChattingInScreen extends StatelessWidget {
  const ChattingInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Center(
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: IconShape.iconArrowBackIos,
                ),
              ),
              const Text(
                '홍길동',
                style: TextStyle(
                    color: fontColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        leadingWidth: 400,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    child: Row(
                      children: [
                        ChattingProfile(),
                        Chat(
                          text: Text('안녕하세요 !'),
                        ),
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 70),
                  child: Chat(text: Text('홍대신가요 ?')),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Chat(text: Text('안녕하세요')),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Chat(text: Text('지금 홍대')),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
      bottomSheet: const BottomInput(),
      resizeToAvoidBottomInset: true,
    );
  }
}
