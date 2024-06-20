import 'package:dating/controller/resister_controller.dart';
import 'package:dating/style/constant.dart';
import 'package:dating/widget/common/bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerifyPage extends GetView<ResisterController> {
  const EmailVerifyPage({super.key});

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
            children: [_email(), _verifyButton()],
          ),
        ),
      ),
    );
  }

  Widget _email() => Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '이메일을 입력해주세요',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: ThemeColor.fontColor),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          '이메일 작성 후 인증번호가 전송됩니다',
          style: TextStyle(
              fontSize: 13,
              color: ThemeColor.font2Color,
              fontWeight: FontWeight.w300),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFEDEDED),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: TextFormField(
              cursorColor: ThemeColor.fontColor,
              controller: controller.email,
              decoration: InputDecoration(
                hintText: 'hello@comment.com',
                border: InputBorder.none,
                hintStyle: TextStyle(color: ThemeColor.font2Color),
              ),
            ),
          ),
        ),
      ],
    ),
  );

  Widget _verifyButton() => SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BottomButton(onTap: controller.emailVerify, child: const Text(
  "인증번호발송",
  style: TextStyle(
  color: Colors.white,
  fontSize: 18,
  fontWeight: FontWeight.w600),),
      )));
}
