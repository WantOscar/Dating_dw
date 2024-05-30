import 'package:dating/Widget/common/warning_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedWriteController extends GetxController {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _content = TextEditingController();

  TextEditingController get title => _title;
  TextEditingController get content => _content;

  /// 피드 작성을 취소할건지 물어보고 뒤로 돌아가는 함수
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
