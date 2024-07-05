import 'package:dating/Widget/common/icon_header.dart';
import 'package:dating/controller/setting_password_controller.dart';
import 'package:dating/controller/user_controller.dart';
import 'package:dating/data/repository/setting_password.repository.dart';
import 'package:dating/data/service/setting_password_service.dart';
import 'package:dating/screen/profile/change_password.dart';
import 'package:dating/style/icon_shape.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountInformationScreen extends GetView<SettingPasswordController> {
  const AccountInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const IconHeader(text: '이메일 확인 및 비밀번호 변경'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Text(
              '연동된 이메일',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text("${UserController.to.myInfo!.nickName}"),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '비밀번호 변경',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Get.to(() => const ChangePassword(),
                          binding: BindingsBuilder(() {
                        Get.put(SettingPasswordController(
                            settingPasswordService: SettingPasswordService(
                                settingPasswordRepository:
                                    SettingPasswordRepository())));
                      }));
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
