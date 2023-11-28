import 'package:dating/Widget/alarm/alarm1.dart';
import 'package:dating/Widget/alarm/alarm10.dart';
import 'package:dating/Widget/alarm/alarm2.dart';
import 'package:dating/Widget/alarm/alarm3.dart';
import 'package:dating/Widget/alarm/alarm4.dart';
import 'package:dating/Widget/alarm/alarm5.dart';
import 'package:dating/Widget/alarm/alarm6.dart';
import 'package:dating/Widget/alarm/alarm7.dart';
import 'package:dating/Widget/alarm/alarm8.dart';
import 'package:dating/Widget/alarm/alarm9.dart';
import 'package:dating/style/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlarmScreen extends StatelessWidget {
  const AlarmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.pink,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  '알림',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: fontColor),
                ),
              ),
            ],
          ),
        ),
        leadingWidth: 200,
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Alarm1(),
            Alarm2(),
            Alarm3(),
            Alarm4(),
            Alarm5(),
            Alarm6(),
            Alarm7(),
            Alarm8(),
            Alarm9(),
            Alarm10(),
          ],
        ),
      ),
    );
  }
}
