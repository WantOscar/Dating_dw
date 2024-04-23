import 'package:dating/binding/home_binding.dart';
import 'package:dating/controller/user_controller.dart';
import 'package:dating/data/provider/auth_service.dart';
import 'package:dating/screen/auth/onboard_screen.dart';
import 'package:dating/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:get/get.dart';

class LoginController extends GetxController {
  final RxBool _isLoading = false.obs;
  final AuthService service;
  final storage = const FlutterSecureStorage();
  static LoginController get to => Get.find();

  LoginController({required this.service});
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  TextEditingController get email => _email;
  TextEditingController get password => _password;
  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    checkAreadyAuth();
    super.onInit();
  }

  /// 로그인이 되어있는지 확인하는 함수
  /// 토큰이 저장되어있다면
  /// 홈화면으로 라우팅됨.
  void checkAreadyAuth() async {
    _isLoading(true);
    await Future.delayed(const Duration(seconds: 1));
    final token = await storage.read(key: "accessToken");

    if (token != null) {
      Get.off(() => const OnboardScreen(), binding: HomeBinding());
    }
    _isLoading(false);
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
