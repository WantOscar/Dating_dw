import 'package:dating/controller/setting_controller.dart';
import 'package:dating/controller/setting_password_controller.dart';
import 'package:dating/data/repository/user_repository.dart';
import 'package:dating/screen/profile/change_password_screen.dart';
import 'package:dating/screen/profile/blocked_account_screen.dart';
import 'package:dating/screen/profile/setting_profile_row.dart';
import 'package:dating/style/icon_shape.dart';
import 'package:dating/utils/api_urls.dart';
import 'package:dating/utils/dio_intercepter.dart';
import 'package:dating/widget/common/cammit_app_bar.dart';
import 'package:dating/widget/setting_profile/human_account_switch_btn.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

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
        child: const CammitAppBar(
          title: "계정 설정",
          showCloseButton: true,
        ),
      ),
      body: Column(
        children: [
          _changePassword(),
          _settingAlertPermission(),
          _blockedAccount(),
          _dormantAccount(),
          _logout(),
          _deleteMember(context),
        ],
      ),
    );
  }

  /// 이메일 확인/비밀번호 변경
  Padding _changePassword() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: SettingProfileRow(
          label: "계정 확인 및 비밀번호 변경",
          onTap: () {
            Get.to(() => const ChangePasswordScreen(),
                binding: BindingsBuilder(() {
              Get.put(SettingPasswordController(
                  userRepository: UserRepositoryImpl(
                      dio: Dio(BaseOptions(baseUrl: ApiUrl.baseUrl))
                        ..interceptors.add(AuthInterceptor())
                        ..interceptors.add(BaseIntercepter()))));
            }));
          },
        ));
  }

  /// 알림 설정 on/off
  Widget _settingAlertPermission() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: SettingProfileRow(
          label: "알림 설정",
          onTap: () async {
            await openAppSettings();
          },
        ));
  }

  /// 차단된 계정 확인
  Widget _blockedAccount() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: SettingProfileRow(
          label: "차단된 계정",
          onTap: () => Get.to(const BlockedAccountScreen()),
        ));
  }

  /// 휴먼 계정으로 전환하기
  Widget _dormantAccount() {
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
        child: SettingProfileRow(
          label: "로그아웃",
          onTap: SettingController.to.showLogoutDialog,
        ));
  }

  /// 회원탈퇴 알림창
  Widget _deleteMember(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: SettingProfileRow(
          label: "회원탈퇴",
          onTap: SettingController.to.showDeleteDialog,
        ));
  }
}
