import 'dart:io';

import 'package:dating/utils/enums.dart';
import 'package:dating/widget/common/notification_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BottomNavController extends GetxController {
  final RxInt _index = 0.obs;
  final List<int> _history = [0];
  int get index => _index.value;

  /// 바텀네비게이션 라우팅 메소드
  void changeIndex(int value) {
    final page = PageName.values[value];
    switch (page) {
      case PageName.main:
      case PageName.search:
      case PageName.chat:
      case PageName.alarm:
      case PageName.profile:
        _moveToPage(value);
    }
  }

  /// 안드로이드 라우팅 정책
  /// 안드로이드 유저는 바텀네비게이션 아이템의 히스토리에 따라서
  /// 팝 액션을 수행함.
  void _moveToPage(int value) {
    if (Platform.isIOS) {
      _index(value);
      return;
    }

    final lastPage = _history.last;
    if (value == lastPage) {
      return;
    } else {
      _index(value);
      _history.add(value);
    }
    debugPrint(_history.toString());
  }

  /// 안드로이드 사용자는 히스토리 직전의 페이지로 팝 액션을 수행함.
  Future<bool> popAction() async {
    if (Platform.isIOS) {
      return true;
    }

    if (_history.length > 1) {
      _history.removeLast();
      _index(_history.last);
      debugPrint(_history.toString());

      return false;
    } else {
      return _showAppCloseDialog();
    }
  }

  /// 안드로이드 사용자가 앱을 종료할 경우
  /// 활성화 되는 다이얼로그 메소드
  _showAppCloseDialog() {
    Get.dialog(NotificationWindow(
      content: "캠밋을 종료하시겠어요?",
      title: "앱 종료",
      confirmLabel: "나가기",
      onConfirm: () {
        SystemNavigator.pop();
      },
      cancelLabel: "취소",
      onCancel: () {
        Get.back();
      },
    ));
  }
}
