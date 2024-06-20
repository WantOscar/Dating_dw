import 'package:dating/data/service/auth_service.dart';
import 'package:dating/screen/auth/code_input_screen.dart';
import 'package:dating/screen/auth/resister_screen.dart';
import 'package:dating/utils/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class EmailVerifyController extends GetxController with UseToast {
  final RxList<String> _inputCode = ["", "", "", "", "", ""].obs;
  final RxInt _cnt = 0.obs;
  static EmailVerifyController get to => Get.find();
  final TextEditingController _email = TextEditingController();
  final AuthService service;
  final String authCode;
  String _authCode = "";

  EmailVerifyController({required this.service, required this.authCode});

  TextEditingController get email => _email;
  List get code => _inputCode;
  int get cnt => _cnt.value;

  /// 인증코드 입력 전달 함수
  /// 인증코드 자리수를 모두 입력한 경우
  /// 인증코드와 일치하는지 확인함
  /// 그렇지 않는 경우
  /// 입력코드를 전달함.
  void inputValue(String value) {
    switch (_cnt.value) {
      case 0:
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
        _inputCode[_cnt.value++] = value;
      default:
        break;
    }

    if (_cnt.value == 6) validateAuthCode();
  }

  /// 입력한 인증코드를
  /// 하나씩 삭제하는
  /// 백스페이스 메소드
  deleteValue() {
    if (_cnt.value == 0) {
      return;
    }
    _inputCode[_cnt.value-- - 1] = "";
  }

  /// 숫자를 누르는 경우
  /// 인증코드를 입력하고
  /// 그렇지 않은 경우엔
  /// 백스페이스 실행
  void onTap(value) {
    if (value == "AC") {
      resetCode();
      return;
    }

    if (value is Widget) {
      deleteValue();
    } else {
      inputValue(value);
    }
  }

  /// 입력한 인증코드와
  /// 서버에서 전달한 인증코드가
  /// 일치하는지 확인하는 메소드
  /// 일치한다면 다음단계로 넘어감
  void validateAuthCode() async {
    print(authCode);
    print(_inputCode.join());
    Get.dialog(
        const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        barrierDismissible: false);
    await Future.delayed(const Duration(seconds: 1));
    Get.back();
    if (authCode == _inputCode.value.join()) {
      showToast("인증에 성공했습니다 !", gravity: ToastGravity.CENTER);
      Get.to(() => const ResisterScreen());
    } else {
      showToast("인증코드가 다릅니다 !", gravity: ToastGravity.CENTER);
    }
    resetCode();
  }

  /// 서버로 부터 입력받은 이메일을 통해
  /// 인증코드 전송 api를 요청하는 메소드
  void sendAuthCode() async {
    final email = _email.value.text.toString();
    final data = {"email": email};
    final response = await service.emailVerify(data);
    if (response != null) {
      _authCode = response;
      Get.to(() => const VerifyScreen());
    }
  }

  /// AC 버튼 함수
  void resetCode() {
    _inputCode.value = ["", "", "", "", "", ""];
    _cnt.value = 0;
  }
}
