import 'package:dating/Widget/common/warning_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedWriteController extends GetxController {
  final _textController1 = TextEditingController();
  final _textController2 = TextEditingController();

  TextEditingController get textController1 => _textController1;
  TextEditingController get textController2 => _textController2;

  /// 뒤로 이동하는 함수
  void cancel() {
    Get.dialog(WarningWindow(
      titleText: '피드 작성 취소',
      explainText: '현재 입력사항을 모두 취소하고 돌아가시겠습니까?',
      onTap: () {
        Get.until((route) => Get.currentRoute == "/HomeScreen");
      },
      btnText: "작성취소",
    ));
  }
}
