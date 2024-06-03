import 'package:dating/controller/setting_controller.dart';
import 'package:dating/screen/profile/account_information_screen.dart';
import 'package:dating/screen/profile/blocked_account_screen.dart';
import 'package:dating/style/icon_shape.dart';
import 'package:dating/widget/common/cammit_app_bar.dart';
import 'package:dating/widget/common/warning_window.dart';
import 'package:dating/widget/setting_profile/human_account_switch_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingAccountScreen extends StatefulWidget {
  const SettingAccountScreen({super.key});

  @override
  State<SettingAccountScreen> createState() => _SettingAccountScreenState();
}

class _SettingAccountScreenState extends State<SettingAccountScreen> {
  bool switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: CammitAppBar(
          title: "계정 설정",
          showCloseButton: true,
          actions: [
            GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.more_horiz,
                  color: Colors.black,
                  size: 30,
                ))
          ],
        ),
      ),
      body: Column(
        children: [
          _changePassword(),
          _popUpNotification(),
          _blockedAccount(),
          _dormantAccount(),
          _logout(),
          _withdrawal(context),
        ],
      ),
    );
  }

  /// 이메일 확인/비밀번호 변경
  Padding _changePassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
            icon: IconShape.iconArrowForward,
          ),
        ],
      ),
    );
  }

  /// 팝업 알림 설정 on/off
  Padding _popUpNotification() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            '알림 설정',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          CupertinoSwitch(
            value: switchValue,
            activeColor: CupertinoColors.activeBlue,
            onChanged: (bool value) {
              setState(() {
                switchValue = value;
              });
            },
          ),
        ],
      ),
    );
  }

  /// 차단된 계정 확인
  Padding _blockedAccount() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
    );
  }

  /// 휴먼 계정으로 전환하기
  Padding _dormantAccount() {
    return const Padding(
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
    );
  }

  /// 로그아웃 알림창
  Widget _logout() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            '로그아웃',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          IconButton(
            onPressed: SettingController.to.showLogoutDialog,
            icon: IconShape.iconArrowForward,
          ),
        ],
      ),
    );
  }

  /// 회원탈퇴 알림창
  Widget _withdrawal(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
                  );
                },
              );
            },
            icon: IconShape.iconArrowForward,
          )
        ],
      ),
    );
  }
}
