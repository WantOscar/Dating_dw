import 'package:dating/data/provider/auth_service.dart';
import 'package:dating/screen/auth/password_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResisterController extends GetxController {
  final RxBool _isLoading = false.obs;
  late String code;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final AuthService service;
  static ResisterController get to => Get.find();
  ResisterController({required this.service});

  TextEditingController get email => _email;
  TextEditingController get password => _password;
  bool get isLoading => _isLoading.value;

  ///이메일로 인증메소드
  void emailVerify() async {
    final email = _email.value.text.toString();
    if (email == "") {
      Get.snackbar("이메일 미기입", "이메일을 입력하세요!");
      return;
    }
    _isLoading(true);
    final data = {"email": _email.value.text.toString()};

    final response = await service.emailVerify(data);
    if (response != null) {
      code = response;
      Get.to(() => const PasswordScreen());
    }
    _email.clear();
  }

  ///회원가입 메소드
  void signUp() {}
}
