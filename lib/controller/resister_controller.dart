import 'package:dating/data/model/member_join.dart';
import 'package:dating/data/service/auth_service.dart';
import 'package:dating/utils/enums.dart';
import 'package:dating/utils/toast_message.dart';
import 'package:dating/widget/common/notification_window.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResisterController extends GetxController with ToastMessage {
  final Rx<Status> _loading = Rx<Status>(Status.loaded);
  late String code;
  late TextEditingController _passwordController;
  late TextEditingController _passwordAgainController;
  final AuthService service;
  static ResisterController get to => Get.find();
  ResisterController({required this.service});

  TextEditingController get password => _passwordController;
  TextEditingController get passwordAgain => _passwordAgainController;
  Status get isLoading => _loading.value;

  late String _email;
  late String _password;
  late String _passwordAgain;

  void init(String email) {
    _email = email;
    _passwordController = TextEditingController();
    _passwordAgainController = TextEditingController();
  }

  ///회원가입 메소드
  void signUp() async {
    /// 비밀번호 확인을 통과하지 못하면 화원가입을
    /// 할 수 없음.
    if (_password != _passwordAgain) {
      showToast("비밀번호가 일치하지 않습니다!");
      return;
    }

    try {
      _loading(Status.loading);
      final memberJoin = MemberJoin(email: _email, password: _password);
      final result = await service.signUp(memberJoin.toJson());
      if (result == "회원가입에 성공했습니다!") {
        showCompeleteDialog();
      }
    } on DioException catch (err) {
      final error = err.error as List;
      final message = error[0] as Map<String, dynamic>;
      showToast(message.values.first.toString());
    } finally {
      _loading(Status.loaded);
    }
  }

  /// 회원가입에 성공하면
  /// 회원가입에 성공했다는 정보를 사용자에게 전달하는 다이얼로그 메소드
  void showCompeleteDialog() {
    Get.dialog(NotificationWindow(
      content: "회원가입에 성공했습니다!\n확인버튼을 누르면 로그인화면으로 이동합니다.",
      title: "회원가입 완료",
      confirmLabel: "확인",
      onConfirm: () {
        Get.until((route) => route.isFirst);
      },
    ));
  }

  void changePasswordAgain(String value) {
    _password = value;
  }

  void changePassword(String value) {
    _passwordAgain = value;
  }
}
