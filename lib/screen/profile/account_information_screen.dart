import 'package:dating/Widget/common/bottom_apply_bar.dart';
import 'package:dating/Widget/common/icon_header.dart';
import 'package:dating/Widget/common/property_text_field.dart';
import 'package:dating/controller/setting_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountInformationScreen extends GetView<SettingPasswordController> {
  const AccountInformationScreen({super.key});

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
              const SizedBox(height: 10),
              _newPwTxt(),
              _newPW(),
              const SizedBox(height: 10),
              _checkNewPwTxt(),
              _checkNewPW(),
              const SizedBox(height: 10),
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
        bottomNavigationBar: BottomApplyBar(
          text: '확인',
          onTap: controller.completeChangePw,
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
      ],
    );
  }

  /// 변경할 비밀번호 입력을 보여주는 txt
  Widget _newPwTxt() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Text(
        '변경할 비밀번호 입력',
        style: TextStyle(
          fontSize: 15,
          color: Colors.black87,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// 새로운 비밀번호를 입력하는 textfield
  Widget _newPW() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: TextField(
        controller: controller.newPassword,
        maxLength: 15,
        style: const TextStyle(decorationThickness: 0, fontSize: 15),
        obscureText: !controller.isTextVisible,
        onChanged: controller.setNewPw,
        decoration: InputDecoration(
          counterText: '',
          hintText: '비밀번호 최대 15자 제한',
          suffixIcon: IconButton(
            onPressed: controller.toggleTextVisibility,
            icon: Icon(controller.isTextVisible
                ? Icons.visibility
                : Icons.visibility_off),
          ),
        ),
      ),
    );
  }

  /// 변경할 비밀번호 확인 입력을 보여주는 txt
  Padding _checkNewPwTxt() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Text(
        '변경된 비밀번호 확인',
        style: TextStyle(
          fontSize: 15,
          color: Colors.black87,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// 새로운 비밀번호 입력 확인을 위한 textfield
  Widget _checkNewPW() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: TextField(
        controller: controller.checkNewPassword,
        onChanged: controller.setCheckNewPw,
        maxLength: 15,
        style: const TextStyle(decorationThickness: 0, fontSize: 15),
        obscureText: !controller.isTextVisible,
        decoration: InputDecoration(
          counterText: '',
          hintText: '비밀번호 최대 15자 제한',
          suffixIcon: IconButton(
            onPressed: controller.toggleTextVisibility,
            icon: Icon(controller.isTextVisible
                ? Icons.visibility
                : Icons.visibility_off),
          ),
        ),
      ),
    );
  }
}
