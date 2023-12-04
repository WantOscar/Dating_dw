import 'package:dating/Widget/icon_header.dart';
import 'package:dating/Widget/setting_profile/alarm_setting.dart';
import 'package:dating/style/icon_shape.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingProfile extends StatelessWidget {
  const SettingProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const IconHeader(text: '설정'),
      body: Column(
        children: [
          // 이메일 확인/비밀번호 변경
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '계정 확인 및 비밀번호 변경',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                IconButton(onPressed: () {}, icon: IconShape.iconArrowForward),
              ],
            ),
          ),

          // 팝업 알림 설정 on/off
          const AlarmSetting(),

          // 차단된 계정 확인
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '차단된 계정',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                IconButton(onPressed: () {}, icon: IconShape.iconArrowForward),
              ],
            ),
          ),

          // 휴먼 계정으로 전환하기
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '휴먼계정 전환',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: true, // 바깥 영역 터치 시 팝업 창 닫을지 말지.
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: const Text('휴먼계정 전환'),
                            actions: [
                              FloatingActionButton(
                                child: const Text('예'),
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                              FloatingActionButton(
                                child: const Text('아니오'),
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: IconShape.iconArrowForward),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
