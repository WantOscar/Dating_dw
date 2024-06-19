import 'package:dating/Widget/common/icon_header.dart';
import 'package:dating/controller/setting_password_controller.dart';
import 'package:dating/widget/common/bottom_apply_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePassword extends GetView<SettingPasswordController> {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: const IconHeader(text: '비밀번호 변경'),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _currentPwTxt(),
              _currentPW(),
              const SizedBox(height: 10),
              _newPwTxt(),
              _newPW(),
              Obx(
                () => (controller.currentPw != controller.newPw)
                    ? Center(
                        child: Text(
                          controller.validateNewPW,
                          style: const TextStyle(color: Colors.red),
                        ),
                      )
                    : Container(),
              ),
              const SizedBox(height: 10),
              _checkNewPwTxt(),
              _checkNewPW(),
              const SizedBox(height: 10),
              Obx(
                () => (controller.newPw != controller.checkNewPw)
                    ? Center(
                        child: Text(
                          controller.validateCheckNewPW,
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
          onTap: controller.changePassword,
        ),
      ),
    );
  }

  /// 현재 비밀번호 입력을 보여주는 text
  Widget _currentPwTxt() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Text(
        '현재 비밀번호 입력',
        style: TextStyle(
          fontSize: 15,
          color: Colors.black87,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// 현재 비밀번호를 입력하는 textfield
  Widget _currentPW() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: TextField(
        controller: controller.currentPassword,
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
