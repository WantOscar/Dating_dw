import 'package:dating/Widget/common/cammit_text_field.dart';
import 'package:dating/Widget/common/offset_loading_widget.dart';
import 'package:dating/controller/email_verify_controller.dart';
import 'package:dating/screen/auth/login_screen.dart';
import 'package:dating/style/constant.dart';
import 'package:dating/utils/enums.dart';
import 'package:dating/widget/common/bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerifyPage extends GetView<EmailVerifyController> {
  const EmailVerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Stack(
        children: [
          Scaffold(
            appBar: _appBar(),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [_email(), _verifyButton()],
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
        backgroundColor: Colors.white,
        elevation: 0,
      );

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
                child: CammitTextField(
                  controller: controller.email,
                  hintText: 'exmaple@example.com',
                  onChanged: controller.changeEmail,
                ),
              ),
            ),
          ],
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
}
