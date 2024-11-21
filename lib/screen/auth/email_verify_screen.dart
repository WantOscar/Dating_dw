import 'package:dating/Widget/common/check_box_widget.dart';
import 'package:dating/widget/common/cammit_text_field.dart';
import 'package:dating/widget/common/offset_loading_widget.dart';
import 'package:dating/controller/email_verify_controller.dart';
import 'package:dating/style/constant.dart';
import 'package:dating/utils/enums.dart';
import 'package:dating/widget/common/bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class EmailVerifyScreen extends GetView<EmailVerifyController> {
  final Uri _url = Uri.parse(
      'https://ani-s3.s3.ap-northeast-2.amazonaws.com/%5B%EB%A1%9C%ED%8F%BC%5D%EA%B0%9C%EC%9D%B8%EC%A0%95%EB%B3%B4%EC%B2%98%EB%A6%AC%EB%B0%A9%EC%B9%A8.pdf');

  EmailVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Stack(
        children: [
          Scaffold(
            appBar: _appBar(),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [_email(context), _verifyButton()],
              ),
            ),
          ),
          _loading(),
        ],
      ),
    );
  }

  AppBar _appBar() => AppBar(
        leading: IconButton(
          onPressed: () {
            Get.until((route) => route.isFirst);
          },
          icon: Icon(
            Icons.arrow_back,
            color: ThemeColor.fontColor,
          ),
        ),
        elevation: 0,
      );

  Widget _email(BuildContext context) => SingleChildScrollView(
        // SingleChildScrollView 추가
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
              CammitTextField(
                controller: controller.email,
                hintText: 'exmaple@example.com',
                onChanged: controller.changeEmail,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                '이용약관 동의',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  _launchUrl();
                },
                child: Text(
                  '이용약관 보기',
                  style: TextStyle(
                    color: ThemeColor.fontColor,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CheckBoxWidget(),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      );

  Widget _verifyButton() => SafeArea(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BottomButton(
            onTap: controller.sendAuthCode,
            child: const Text(
              "인증번호발송",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          )));

  Widget _loading() => Obx(
        () => Offstage(
          offstage: (controller.isLoading == Status.loading) ? false : true,
          child: const OffsetLoadingWidget(),
        ),
      );

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
