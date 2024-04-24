import 'package:dating/controller/resister_controller.dart';
import 'package:dating/style/constant.dart';
import 'package:dating/utils/status_enum.dart';
import 'package:dating/widget/common/button_loading_indicator.dart';
import 'package:dating/widget/common/cammit_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResisterScreen extends GetView<ResisterController> {
  const ResisterScreen({super.key});

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
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _header(),
                const SizedBox(
                  height: 30,
                ),
                _passwordInput(),
              ],
            ),
          ),
          bottomNavigationBar: _signUpButton()),
    );
  }

  /// 비밀번호 입력 페이지 상단 설명 위젯
  Widget _header() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '비밀번호를 입력해주세요',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ThemeColor.fontColor),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '이제 마지막 단계에요 :)',
            style: TextStyle(
                fontSize: 13,
                color: ThemeColor.font2Color,
                fontWeight: FontWeight.w300),
          ),
        ],
      );

  Widget _passwordInput() => Column(
        children: [
          /// 회원가입 통합 테스트를 위한 임시 위젯
          /// 추후에 삭제될 예정임.
          /// 이메일은 이메일 인증에서 사용한 이메일을 그대로 사용함.
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                  child: Text(
                    "이메일",
                    style: TextStyle(color: Colors.black87, fontSize: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CammitTextField(
                    controller: ResisterController.to.email,
                    hintText: "이메일을 입력해주세요!",
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                  child: Text(
                    "비밀번호",
                    style: TextStyle(color: Colors.black87, fontSize: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CammitTextField(
                    controller: ResisterController.to.password,
                    hintText: "비밀번호를 입력해주세요!",
                    obscureText: true,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                  child: Text(
                    "비밀번호 확인",
                    style: TextStyle(color: Colors.black87, fontSize: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CammitTextField(
                    controller: ResisterController.to.passwordAgain,
                    hintText: "비밀번호를 다시 입력해주세요!",
                    obscureText: true,
                  ),
                ),
              ],
            ),
          )
        ],
      );

  Widget _signUpButton() => Obx(
        () => GestureDetector(
          onTap:
              (controller.loading == Status.loading) ? null : controller.signUp,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: SafeArea(
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    color: ThemeColor.fontColor),
                child: (controller.loading == Status.loading)
                    ? const ButtonLoadingIndicator()
                    : const Center(
                        child: Text(
                          '회원가입',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15),
                        ),
                      ),
              ),
            ),
          ),
        ),
      );
}
