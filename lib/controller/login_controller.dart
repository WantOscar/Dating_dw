import 'package:dating/controller/onboard_controller.dart';
import 'package:dating/data/model/token_provider.dart';
import 'package:dating/data/service/auth_service.dart';
import 'package:dating/data/service/user_fetch.dart';
import 'package:dating/screen/auth/onboard_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/show_toast.dart';

class LoginController extends GetxController with UseToast {
  final RxBool _isLoading = false.obs;
  final tokenProvider = TokenProvider();
  final AuthService authService;
  static LoginController get to => Get.find();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  TextEditingController get email => _email;
  TextEditingController get password => _password;
  bool get isLoading => _isLoading.value;
  LoginController({
    required this.authService,
  });

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
    if (token != "") {
      _moveToOnboard();
    }
    _isLoading(false);
  }

  /// 로그인 후 프로필 등록 온보딩 페이지 혹은 메인 페이지로 라우팅됨.
  /// 계정의 프로필이 존재하지 않는 경우 프로필 등록을 위해 온보딩 페이지로 라우팅됨.
  void login() async {
    _isLoading(true);
    final data = {
      "email": _email.value.text.toString(),
      "password": _password.value.text.toString()
    };

    final accessToken = await authService.login(data);
    print("respnose : $accessToken");
    _isLoading(false);
    if (accessToken != null) {
      /// FCM Token 갱신
      final fcmToken = await FirebaseMessaging.instance.getToken();
      if (fcmToken != null) {
        authService.updateFCMtoken(fcmToken, accessToken);
      }

      ///컨트롤러 값 초기화
      _email.clear();
      _password.clear();
      _moveToOnboard();
    }
  }

  void logout() => authService.logOut();

  void delete() => authService.delete();

  void _moveToOnboard() {
    Get.off(() => const OnboardScreen(), binding: BindingsBuilder(() {
      Get.put(OnboardingController(userService: UserFetch()));
    }));
  }
}
