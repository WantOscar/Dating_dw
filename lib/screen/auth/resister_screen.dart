import 'package:dating/controller/resister_controller.dart';
import 'package:dating/style/constant.dart';
import 'package:dating/utils/enums.dart';
import 'package:dating/widget/common/bottom_button.dart';
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
                Expanded(
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
                _signUpButton(),
              ],
            ),
          ),
      ),
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
        () => SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BottomButton(onTap: () {
                (controller.loading == Status.loading) ? null : controller.signUp();
              }, child: (controller.loading == Status.loading)?  Center(child: CircularProgressIndicator(
                
              ),) : Text(
                "회원가입",
                style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600),),)
            ))
      );
}
