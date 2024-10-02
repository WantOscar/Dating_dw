import 'package:dating/utils/show_toast.dart';
import 'package:dating/widget/common/notification_window.dart';
import 'package:dating/widget/common/warning_window.dart';
import 'package:dating/controller/feed_controller.dart';
import 'package:dating/data/model/feed.dart';
import 'package:dating/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedWriteController extends GetxController with UseToast {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  TextEditingController get titleController => _titleController;
  TextEditingController get contentController => _contentController;

  String _title = "";
  String _content = "";

  /// 피드 작성을 취소할건지 물어보고 뒤로 돌아가는 함수
  void cancel() {
    Get.dialog(NotificationWindow(
      title: '피드 작성 취소',
      content: '현재 입력사항을 모두 취소하고 돌아가시겠습니까?',
      confirmLabel: "확인",
      cancelLabel: "취소",
      onConfirm: () {
        Get.until((route) => route.isFirst);
      },
      onCancel: () => Get.until((route) => route.isFirst),
    ));
  }

  void writeFeed() {
    if (_title.isEmpty) {
      showToast("제목을 입력하세요!");
      return;
    }

    if (_content.isEmpty) {
      showToast("내용을 입력하세요!");
      return;
    }
    final Feed feed = Feed(title: _title, content: _content);

    Get.dialog(NotificationWindow(
      title: '피드 작성 완료',
      content: '작성을 완료하시겠습니까?',
      confirmLabel: "피드 등록",
      onConfirm: () {
        /// 글쓰기 API
        ///
        ///
        FeedController.to.writeFeed(feed);
        Get.off(() => const HomeScreen());
      },
      cancelLabel: "취소",
      onCancel: Get.back,
    ));
  }

  void titleChange(String value) {
    _title = value;
  }

  void contentChange(String value) {
    _content = value;
  }
}
