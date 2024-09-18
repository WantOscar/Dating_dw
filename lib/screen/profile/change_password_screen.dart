import 'package:dating/widget/common/bottom_button.dart';
import 'package:dating/widget/common/icon_header.dart';
import 'package:dating/widget/common/property_text_field.dart';
import 'package:dating/controller/setting_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends GetView<SettingPasswordController> {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: const IconHeader(text: '비밀번호 변경'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _currentPW(),
              _newPW(),
              _checkNewPW(),
              Obx(
                () => (controller.validateMg.isNotEmpty)
                    ? Center(
                        child: Text(
                          controller.validateMg,
                          style: const TextStyle(color: Colors.red),
                        ),
                      )
                    : Container(),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: BottomButton(
            onTap: controller.completeChangePw,
            child: const Text("확인",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600)),
          ),
        ),
      ),
    );
  }

  /// 현재 비밀번호를 입력하는 textfield
  Widget _currentPW() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Text(
            '현재 비밀번호 입력',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: PropertyTextField(
            // obscureText: !controller.isTextVisible,
            controller: controller.currentPassword,
            onChanged: controller.setCurrentPw,
            label: "현재 비밀번호",
            sufficIcon: IconButton(
              onPressed: controller.toggleTextVisibility,
              icon: Icon(controller.isTextVisible
                  ? Icons.visibility
                  : Icons.visibility_off),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  /// 새로운 비밀번호를 입력하는 textfield
  Widget _newPW() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Text(
            '변경할 비밀번호 입력',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: PropertyTextField(
            // obscureText: !controller.isTextVisible,
            controller: controller.newPassword,
            onChanged: controller.setNewPw,
            label: "현재 비밀번호",
            sufficIcon: IconButton(
              onPressed: controller.toggleTextVisibility,
              icon: Icon(controller.isTextVisible
                  ? Icons.visibility
                  : Icons.visibility_off),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  /// 새로운 비밀번호 입력 확인을 위한 textfield
  Widget _checkNewPW() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Text(
            '변경된 비밀번호 입력',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: PropertyTextField(
            // obscureText: !controller.isTextVisible,
            controller: controller.checkNewPassword,
            onChanged: controller.setCheckNewPw,
            label: "현재 비밀번호",
            sufficIcon: IconButton(
              onPressed: controller.toggleTextVisibility,
              icon: Icon(controller.isTextVisible
                  ? Icons.visibility
                  : Icons.visibility_off),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
