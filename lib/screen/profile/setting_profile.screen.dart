import 'package:dating/controller/login_controller.dart';
import 'package:dating/widget/common/warning_window.dart';
import 'package:dating/widget/icon_header.dart';
import 'package:dating/widget/setting_profile/alarm_setting.dart';
import 'package:dating/widget/setting_profile/human_account_switch_btn.dart';
import 'package:dating/screen/profile/account_information_screen.dart';
import 'package:dating/screen/profile/blocked_account_screen.dart';
import 'package:dating/style/icon_shape.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingProfileScreen extends StatelessWidget {
  const SettingProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const IconHeader(text: '설정'),
      body: Column(
        children: [
          /// 이메일 확인/비밀번호 변경
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
                IconButton(
                    onPressed: () {
                      Get.to(() => const AccountInformationScreen());
                    },
                    icon: IconShape.iconArrowForward),
              ],
            ),
          ),

          /// 팝업 알림 설정 on/off
          const AlarmSetting(),

          /// 차단된 계정 확인
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
                IconButton(
                    onPressed: () {
                      Get.to(const BlockedAccountScreen());
                    },
                    icon: IconShape.iconArrowForward),
              ],
            ),
          ),

          /// 휴먼 계정으로 전환하기
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '휴먼계정 전환',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                HumanAccountSwitchBtn(),
              ],
            ),
          ),

          /// 로그아웃 알림창
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '로그아웃',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return WarningWindow(
                          onTap: LoginController.to.logout,
                          titleText: '로그아웃',
                          explainText: '정말로 로그아웃 하시나요 ?',
                          btnText: '로그아웃',
                          context: context,
                        );
                      },
                    );
                  },
                  icon: IconShape.iconArrowForward,
                ),
              ],
            ),
          ),

          /// 회원탈퇴 알림창
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '회원탈퇴',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return WarningWindow(
                          onTap: () {},
                          titleText: '회원탈퇴',
                          explainText:
                              '캠밋을 탈퇴하면 계정의 모든 정보가 삭제되며, 삭제된 정보는 복구할 수 없습니다.',
                          btnText: '회원탈퇴',
                          context: context,
                        );
                      },
                    );
                  },
                  icon: IconShape.iconArrowForward,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
