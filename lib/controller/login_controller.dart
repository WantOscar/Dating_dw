import 'package:dating/binding/home_binding.dart';
import 'package:dating/controller/onboard_controller.dart';
import 'package:dating/data/model/token_provider.dart';
import 'package:dating/data/provider/auth_service.dart';
import 'package:dating/screen/auth/onboard_screen.dart';
import 'package:dating/utils/toast_message.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LoginController extends GetxController {
  final RxBool _isLoading = false.obs;
  final AuthService service;
  final tokenProvider = TokenProvider();
  static LoginController get to => Get.find();
  LoginController({required this.service});
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  TextEditingController get email => _email;
  TextEditingController get password => _password;
  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    _checkAreadyAuth();
    super.onInit();
  }

  /// 로그인이 되어있는지 확인하는 함수
  /// 토큰이 저장되어있다면
  /// 홈화면으로 라우팅됨.
  void _checkAreadyAuth() async {
    _isLoading(true);
    await Future.delayed(const Duration(seconds: 1));
    final token = await tokenProvider.getRefreshToken();
    _checkAuthoriztion(token);
    _isLoading(false);
  }

  /// 토큰 유효성 검사 메소드
  /// 토큰 유효성을 검사하는 동안 사용자에게 검사중 메시지를 전달하고
  /// 유효성 검사에서 통과하면 자동 로그인
  void _checkAuthoriztion(String token) async {
    final authorization = await service.refreshToken(token);
    if (authorization) {
      Get.off(() => const OnboardScreen(), binding: HomeBinding());
    } else {
      logout();
    }
  }

  void login() async {
    print("로그인");
    _isLoading(true);
    final data = {
      "email": _email.value.text.toString(),
      "password": _password.value.text.toString()
    };

    await service.login(data);
    _isLoading(false);

    ///컨트롤러 값 초기화
    _email.clear();
    _password.clear();
  }

  void logout() => service.logOut();
}
