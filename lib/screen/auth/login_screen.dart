import 'package:dating/binding/reset_password_binding.dart';
import 'package:dating/binding/resister_binding.dart';
import 'package:dating/controller/login_controller.dart';
import 'package:dating/screen/auth/auth_forgot_screen.dart';
import 'package:dating/screen/auth/password_screen.dart';
import 'package:dating/screen/auth/signup_screen.dart';
import 'package:dating/style/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          GestureDetector(
            onTap: FocusScope.of(context).unfocus,
            child: Scaffold(
              body: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _title(),
                      const SizedBox(
                        height: 50,
                      ),
                      _loginFields(),
                      _forgotAccount()
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: _signUp(),
            ),
          ),
          _loading(),
        ],
      ),
    );
  }

  /// 앱 타이틀 위젯
  Widget _title() {
    return Column(
      children: [
        const Text(
          '캠퍼스와 만남,',
          style: TextStyle(
              fontSize: 12,
              color: Color(0xFFBEBEBE),
              fontWeight: FontWeight.bold),
        ),
        Text(
          '캠밋',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 50,
              color: ThemeColor.fontColor),
        ),
      ],
    );
  }

  /// 로그인을 위한 이메일과 비밀번호를 입력하는 텍스트 필드와
  /// 로그인을 시도하는 버튼 위젯.
  Widget _loginFields() {
    return Column(
      children: [
        Container(
          width: Get.size.width * 0.8,
          height: Get.size.width * 0.16,
          decoration: BoxDecoration(
              color: const Color(0xFFEDEDED),
              borderRadius: BorderRadius.circular(45),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 8))
              ]),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                controller: controller.email,
                cursorColor: ThemeColor.fontColor,
                decoration: const InputDecoration(
                  hintText: '이메일을 입력해주세요.',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: Get.size.width * 0.8,
          height: Get.size.width * 0.16,
          decoration: BoxDecoration(
              color: const Color(0xFFEDEDED),
              borderRadius: BorderRadius.circular(45),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 8))
              ]),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                cursorColor: ThemeColor.fontColor,
                controller: controller.password,
                decoration: const InputDecoration(
                  hintText: '비밀번호를 입력해주세요.',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
                obscureText: true,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: controller.login,
          highlightColor: Colors.white,
          borderRadius: BorderRadius.circular(45),
          child: Container(
            width: Get.size.width * 0.8,
            height: Get.size.width * 0.16,
            decoration: BoxDecoration(
                color: const Color(0xFFFF006B),
                borderRadius: BorderRadius.circular(45),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 8))
                ]),
            child: const Center(
              child: Text(
                '로그인',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// 계정을 잊었을 때 이용하는 텍스트 버튼
  Widget _forgotAccount() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Get.to(() => const AuthForgotScreen(),
                binding: ResetPasswordBinding());
          },
          child: Text(
            '계정을 잃어버리셨나요?',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: ThemeColor.fontColor),
          ),
        ),
      );

  /// 계정을 생성하기 위한 라우팅 버튼
  Widget _signUp() {
    return BottomAppBar(
      shadowColor: Colors.white,
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '캠밋이 처음이신가요?',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () {
                // Get.to(() => const SignUpPage(), binding: ResisterBinding());
                /// 회원정보 등록을 위해 임의로 이메일 인증을 스킵.
                Get.to(() => const PasswordScreen(),
                    binding: ResisterBinding());
              },
              child: Text(
                '회원가입',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: ThemeColor.fontColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _loading() => Offstage(
        offstage: controller.isLoading ? false : true,
        child: Stack(
          children: [
            ModalBarrier(
              color: Colors.black.withOpacity(0.4),
            ),
            Center(
              child: CircularProgressIndicator(
                color: ThemeColor.fontColor,
              ),
            )
          ],
        ),
      );
}
