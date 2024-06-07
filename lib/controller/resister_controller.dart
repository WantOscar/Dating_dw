import 'package:dating/controller/email_verify_controller.dart';
import 'package:dating/data/model/member_join.dart';
import 'package:dating/data/service/auth_service.dart';
import 'package:dating/screen/auth/auth_forgot_screen.dart';
import 'package:dating/screen/auth/code_input_screen.dart';
import 'package:dating/screen/auth/login_screen.dart';
import 'package:dating/screen/auth/resister_screen.dart';
import 'package:dating/utils/enums.dart';
import 'package:dating/widget/common/notification_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResisterController extends GetxController {
  final Rx<Status> _loading = Rx<Status>(Status.loaded);
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
  Status get loading => _loading.value;

  ///이메일로 인증메소드
  void emailVerify() async {
    final email = _email.value.text.toString();
    if (email == "") {
      Get.snackbar("이메일 미기입", "이메일을 입력하세요!");
      return;
    }

    final data = {"email": _email.value.text.toString()};
    Get.focusScope?.unfocus();
    final response = await service.emailVerify(data);
    if (response != null) {
      code = response;
      Get.to(() => const VerifyScreen(), binding: BindingsBuilder(() {
        Get.put(EmailVerifyController(service: service, authCode: code));
      }));
    }
  }

  ///회원가입 메소드
  void signUp() async {
    /// 비밀번호 확인을 통과하지 못하면 화원가입을
    /// 할 수 없음.
    if (_password.text.toString() != _passwordAgain.text.toString()) {
      return;
    }

    _loading(Status.loading);
    final memberJoin = MemberJoin(
        email: _email.text.toString(), password: _password.text.toString());
    final result = await service.signUp(memberJoin.toJson());
    if (result == "회원가입에 성공했습니다!") {
      showCompeleteDialog();
    }
    _loading(Status.loaded);
  }

  /// 회원가입에 성공하면
  /// 회원가입에 성공했다는 정보를 사용자에게 전달하는 다이얼로그 메소드
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
