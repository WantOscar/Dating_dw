import 'package:dating/data/service/setting_password_service.dart';
import 'package:dating/screen/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPasswordController extends GetxController {
  final SettingPasswordService settingPasswordService;
  SettingPasswordController({required this.settingPasswordService});

  static SettingPasswordController get to => Get.find();

  final RxBool _isTextVisible = false.obs;
  final RxString _validateMg = "".obs;
  // final RxString _validateNewPW = "현재 비밀번호와 동일합니다!".obs;
  // final RxString _validateNewPW = "".obs;
  // final RxString _validateCheckNewPW = "비밀번호가 일치하지 않습니다!".obs;
  // final RxString _validateCheckNewPW = "".obs;
  final RxString _currentPw = "".obs;
  final RxString _newPw = "".obs;
  final RxString _checkNewPw = "".obs;
  final TextEditingController _currentPassword = TextEditingController();
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _checkNewPassword = TextEditingController();

  bool get isTextVisible => _isTextVisible.value;
  String get validateMg => _validateMg.value;
  // String get validateNewPW => _validateNewPW.value;
  // String get validateCheckNewPW => _validateCheckNewPW.value;

  String get currentPw => _currentPw.value;
  String get newPw => _newPw.value;
  String get checkNewPw => _checkNewPw.value;
  TextEditingController get currentPassword => _currentPassword;
  TextEditingController get newPassword => _newPassword;
  TextEditingController get checkNewPassword => _checkNewPassword;

  @override
  void onInit() {
    super.onInit();
    _currentPassword.addListener(validatePasswords);
    _newPassword.addListener(validatePasswords);
    _checkNewPassword.addListener(validatePasswords);
  }

  @override
  void onClose() {
    super.onClose();
    _currentPassword.removeListener(validatePasswords);
    _newPassword.removeListener(validatePasswords);
    _currentPassword.dispose();
    _newPassword.dispose();
    _checkNewPassword.dispose();
  }

  void validatePasswords() {
    _currentPw(_currentPassword.text);
    _newPw(_newPassword.text);
    _checkNewPw(_checkNewPassword.text);

    if (_currentPw.value == "") {
      _validateMg("");
      return;
    }

    if (_currentPw.value == _newPw.value) {
      _validateMg("기존 비밀번호와 동일합니다!");
      return;
    }

    if (_newPw.value != _checkNewPw.value && _checkNewPw.value != "") {
      _validateMg("변경할 비밀번호가 일치하지 않습니다!");
      return;
    } else {
      _validateMg("");
      return;
    }
  }

  void toggleTextVisibility() {
    _isTextVisible(!_isTextVisible.value);
  }

  void setCurrentPw(String value) {
    _currentPw(value);
  }

  void setNewPw(String value) {
    _newPw(value);
  }

  void setCheckNewPw(String value) {
    _checkNewPw(value);
  }

  void completeChangePw() async {
    final data = {
      "currentPassword": _currentPw,
      "newPassword": _newPw,
      "checkNewPassword": _checkNewPw,
    };
    Get.off(() => const ProfileScreen());
  }
}
