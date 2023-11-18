import 'package:dating/Widget/meet/meet_create1/select_meet_method.dart';
import 'package:dating/screen/meet/meeting_create2_screen.dart';
import 'package:dating/style/constant.dart';
import 'package:dating/style/icon_shape.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeetingCreate1Screen extends StatelessWidget {
  const MeetingCreate1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: IconShape.iconArrowBack,
            onPressed: () {
              Get.back();
            },
          ),
        ),
        title: const Text(
          '과팅/미팅 방 선택',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: fontColor),
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // select you want room text
            Text(
              '원하시는 방을 선택해 주세요',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: fontColor),
            ),
            SizedBox(height: 30),

            // select college students or general button
            SelectMeetMethod(),
          ],
        ),
      ),
      // select the room you want, and go to the next screen
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: BottomAppBar(
          shadowColor: Colors.white,
          elevation: 0,
          child: GestureDetector(
            onTap: () {
              Get.to(const MeetingCreate2Screen());
            },
            child: Container(
              width: width,
              height: height * 0.07,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: fontColor),
              child: const Center(
                child: Text(
                  '확인',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
