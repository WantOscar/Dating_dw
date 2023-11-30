import 'package:dating/Widget/common_header.dart';
import 'package:dating/Widget/meet/meeting_room.dart';
import 'package:dating/Widget/meet/select_room.dart';
import 'package:dating/screen/meet/meeting_create1_screen.dart';
import 'package:dating/style/constant.dart';
import 'package:dating/style/icon_shape.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeetingScreen extends StatelessWidget {
  const MeetingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonHeader(text: '오늘의 과팅❤️‍🔥'),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            // select college student or general
            SelectRoom(),
            SizedBox(height: 20),

            // meeting
            MeetingRoom(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const MeetingCreate1Screen());
        },
        backgroundColor: fontColor,
        child: IconShape.iconAdd,
      ),
    );
  }
}
