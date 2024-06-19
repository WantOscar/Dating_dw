import 'package:dating/data/service/setting_password_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPasswordController extends GetxController {
  final SettingPasswordService settingPasswordService;
  SettingPasswordController({required this.settingPasswordService});

  static SettingPasswordController get to => Get.find();

  final RxBool _isTextVisible = false.obs;
  final RxString _validateNewPassword = "비밀번호가 일치하지 않습니다!".obs;
  final RxString _newPw = "".obs;
  final RxString _checkNewPw = "".obs;
  final TextEditingController _currentPassword = TextEditingController();
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _checkNewPassword = TextEditingController();

  bool get isTextVisible => _isTextVisible.value;
  String get validateNewPassword => _validateNewPassword.value;
  String get newPw => _newPw.value;
  String get checkNewPw => _checkNewPw.value;
  TextEditingController get currentPassword => _currentPassword;
  TextEditingController get newPassword => _newPassword;
  TextEditingController get checkNewPassword => _checkNewPassword;

  void toggleTextVisibility() {
    _isTextVisible(!_isTextVisible.value);
  }

  void setNewPw(String value) {
    _newPw(value);
  }

  void setCheckNewPw(String value) {
    _checkNewPw(value);
  }

  void changePassword(Map<String, dynamic> data) async {
    final result = await settingPasswordService.postSettingPassword(data);

    if (result != null) {}
  }
}
