import 'package:dating/controller/resister_controller.dart';
import 'package:dating/data/service/auth_service.dart';
import 'package:dating/screen/auth/code_input_screen.dart';
import 'package:dating/screen/auth/resister_screen.dart';
import 'package:dating/utils/enums.dart';
import 'package:dating/utils/show_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class EmailVerifyController extends GetxController with UseToast {
  EmailVerifyController({required this.service});

  final Rx<Status> _isLoading = Rx<Status>(Status.loaded);
  final RxList<String> _inputCode = ["", "", "", "", "", ""].obs;
  final RxInt _cnt = 0.obs;
  static EmailVerifyController get to => Get.find();
  final TextEditingController _emailController = TextEditingController();
  final AuthService service;
  late String authCode;
  final RxBool _clicked = false.obs;

  TextEditingController get email => _emailController;
  List get code => _inputCode;
  int get cnt => _cnt.value;
  Status get isLoading => _isLoading.value;
  bool get clicked => _clicked.value;

  String _email = "";

  final Uri _url = Uri.parse(
      'https://ani-s3.s3.ap-northeast-2.amazonaws.com/%5B%EB%A1%9C%ED%8F%BC%5D%EA%B0%9C%EC%9D%B8%EC%A0%95%EB%B3%B4%EC%B2%98%EB%A6%AC%EB%B0%A9%EC%B9%A8.pdf');

  /// 이용약관을 click 하면 url로 들어가도록 함
  void termsOfUser() {
    _launchUrl();
    _clicked(true);
  }

  /// url을 모바일 앱 환경에서 실행할 수 있도록 함
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  /// 인증코드 입력 전달 함수
  /// 인증코드 자리수를 모두 입력한 경우
  /// 인증코드와 일치하는지 확인함
  /// 그렇지 않는 경우
  /// 입력코드를 전달함.
  void inputValue(String value) {
    _inputCode[_cnt.value++] = value;
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
    if (authCode == _inputCode.join()) {
      showToast("인증에 성공했습니다 !");
      ResisterController.to.init(_email);
      Get.to(() => const ResisterScreen());
    } else {
      showToast("인증코드가 다릅니다 !");
    }
    resetCode();
  }

  /// 서버로 부터 입력받은 이메일을 통해
  /// 인증코드 전송 api를 요청하는 메소드
  void sendAuthCode() async {
    if (_email.isEmpty) {
      showToast("이메일을 입력해주세요!", gravity: ToastGravity.CENTER);
      return;
    }

    try {
      final data = {"email": _email};
      _isLoading(Status.loading);
      authCode = await service.emailVerify(data);
      Get.to(() => const CodeInputScreen());
    } on DioException catch (err) {
      final error = err.error as List;
      final message = error[0]["email"];
      showToast(message, gravity: ToastGravity.CENTER);
    } finally {
      _isLoading(Status.loaded);
    }
  }

  /// AC 버튼 함수
  void resetCode() {
    _inputCode.value = ["", "", "", "", "", ""];
    _cnt.value = 0;
  }

  void changeEmail(String value) {
    _email = value;
  }
}
