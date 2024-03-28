import 'package:dating/controller/user_controller.dart';
import 'package:dating/data/provider/auth_service.dart';
import 'package:dating/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:get/get.dart';

class LoginController extends GetxController {
  final RxBool isLoading = false.obs;
  final AuthService service;
  final storage = const FlutterSecureStorage();
  static LoginController get to => Get.find();

  LoginController({required this.service});
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  TextEditingController get email => _email;
  TextEditingController get password => _password;

  void login() async {
    print("로그인");
    isLoading(true);
    final data = {
      "email": _email.value.text.toString(),
      "password": _password.value.text.toString()
    };

    await service.login(data);
    isLoading(false);

    ///컨트롤러 값 초기화
    _email.clear();
    _password.clear();

    /// 로그인 시 데이터 패치
    UserController.to.fetchData();
    // UserController.to.searchMyInfo();
  }

  void logout() => service.logOut();
}
