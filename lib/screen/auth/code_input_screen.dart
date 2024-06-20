import 'package:dating/Widget/common/code_box.dart';
import 'package:dating/Widget/common/keyboard_key.dart';
import 'package:dating/controller/email_verify_controller.dart';
import 'package:dating/style/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyScreen extends GetView<EmailVerifyController> {
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
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
              _body(),
              _keyboard(),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() => Column(
        children: [
          Text(
            '인증번호 6자를 입력해 주세요',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ThemeColor.fontColor),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            '작성하신 이메일로 인증번호가 전송됐을 거에요',
            style: TextStyle(
                fontSize: 13, color: Colors.grey, fontWeight: FontWeight.w300),
          ),
        ],
      );

  Widget _body() => Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
                6,
                (index) => CodeBox(
                      value: controller.code[index],
                    )),
          ),
        ),
      );

  Widget _keyboard() {
    final keys = [
      ["1", "2", "3"],
      ["4", "5", "6"],
      ["7", "8", "9"],
      ["AC", "0", const Icon(Icons.keyboard_backspace)]
    ];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: keys
            .map((key) => Row(
                  children: key.map((e) {
                    return Expanded(
                        child: KeyboardKey(
                            label: e, value: e, onTap: controller.onTap));
                  }).toList(),
                ))
            .toList(),
      ),
    );
  }
}
