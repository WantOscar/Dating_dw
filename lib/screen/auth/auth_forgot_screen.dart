import 'package:dating/controller/email_verify_controller.dart';
import 'package:dating/screen/auth/login_screen.dart';
import 'package:dating/style/constant.dart';
import 'package:dating/widget/common/bottom_button.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthForgotScreen extends GetView<EmailVerifyController> {
  const AuthForgotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: ThemeColor.fontColor,
              ),
            ),
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                _header(),
                const SizedBox(
                  height: 30,
                ),
                _email(),
              ],
            ),
          ),
          bottomNavigationBar: SafeArea(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BottomButton(
                    color: ThemeColor.fontColor,
                    onTap: controller.sendAuthCode,
                    child: const Text(
                      "인증번호발송",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  )))),
    );
  }

  Widget _header() => Column(
        children: [
          Row(
            children: [
              Text(
                '이메일을 입력해주세요',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ThemeColor.fontColor),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            children: [
              Text(
                '최초가입 이메일을 입력해주세요',
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ],
      );

  Widget _email() => Center(
        child: TextFormField(
          cursorColor: ThemeColor.fontColor,
          keyboardType: TextInputType.emailAddress,
          controller: controller.email,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.email,
              color: ThemeColor.fontColor,
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: ThemeColor.fontColor)),
            hintText: 'hello@comment.com',
            hintStyle: TextStyle(color: ThemeColor.font2Color),
          ),
        ),
      );
}

class VerifyBox extends StatelessWidget {
  const VerifyBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.13,
      height: MediaQuery.of(context).size.width * 0.18,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.grey),
    );
  }
}

class PasswordChangeScreen extends StatelessWidget {
  const PasswordChangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: ThemeColor.fontColor,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '변경하실 비밀번호를 입력해주세요',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: ThemeColor.fontColor),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '마지막 단계에요 :)',
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                  fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                color: const Color(0xFFEDEDED),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: '비밀번호를 입력해주세요',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: ThemeColor.font2Color),
                    // ),
                    // onChanged: (value) {
                    //   authController.user.update((user) {
                    //     user!.email = value;
                    //   });
                    // },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BottomAppBar(
          shadowColor: Colors.white,
          elevation: 0,
          child: GestureDetector(
            onTap: () {
              Get.to(() => const LoginScreen());
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: ThemeColor.fontColor),
              child: const Center(
                child: Text(
                  '확인',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
