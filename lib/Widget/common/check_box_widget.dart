import 'package:dating/controller/email_verify_controller.dart';
import 'package:dating/style/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({super.key});

  @override
  State<CheckBoxWidget> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBoxWidget> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    final EmailVerifyController controller = EmailVerifyController.to;

    return Obx(
      () => CheckboxListTile(
        value: _isChecked,
        title: const Text('이용약관 전체 동의'),
        onChanged: controller.clicked
            ? (bool? value) {
                setState(() {
                  _isChecked = value!;
                });
              }
            : null,
        controlAffinity: ListTileControlAffinity.trailing,
        activeColor: ThemeColor.warningText,
        checkColor: ThemeColor.fontColor,
      ),
    );
  }
}
