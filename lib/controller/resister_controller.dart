import 'package:dating/data/provider/auth_service.dart';
import 'package:dating/screen/auth/login_screen.dart';
import 'package:dating/screen/auth/password_screen.dart';
import 'package:dating/widget/common/notification_window.dart';
import 'package:dating/widget/common/warning_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResisterController extends GetxController {
  final RxBool _isLoading = false.obs;
  late String code;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _passwordAgain = TextEditingController();
  final AuthService service;
  static ResisterController get to => Get.find();
  ResisterController({required this.service});

  TextEditingController get email => _email;
  TextEditingController get password => _password;
  TextEditingController get passwordAgain => _passwordAgain;
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
  void signUp() async {
    /// 비밀번호 확인을 통과하지 못하면 화원가입을
    /// 할 수 없음.
    if (_password.text.toString() != _passwordAgain.text.toString()) {
      return;
    }
    final data = {
      "email": _email.text.toString(),
      "password": _password.toString(),
    };

    final result = await service.signUp(data);
    if (result == "회원가입에 성공했습니다!") showCompeleteDialog();
  }

  void showCompeleteDialog() {
    Get.dialog(NotificationWindow(
      content: "회원가입에 성공했습니다!\n확인버튼을 누르면 로그인화면으로 이동합니다.",
      title: "회원가입 완료",
      confirmLabel: "확인",
      onConfirm: () {
        Get.offAll(const LoginScreen());
      },
    ));
  }
}
