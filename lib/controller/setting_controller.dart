import 'package:dating/controller/login_controller.dart';
import 'package:dating/widget/common/notification_window.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  static SettingController get to => Get.find();

  void showLogoutDialog() {
    Get.dialog(NotificationWindow(
      content: "정말로 로그아웃 하시겠어요?",
      title: "로그아웃",
      confirmLabel: "로그아웃",
      onConfirm: LoginController.to.logout,
      cancelLabel: "취소",
      onCancel: Get.back,
    ));
  }

  void showDeleteDialog() {
    Get.dialog(NotificationWindow(
      content: "정말로 회원을 탈퇴하시겠습니까?",
      title: "회원탈퇴",
      confirmLabel: "회원탈퇴",
      onConfirm: LoginController.to.delete,
      cancelLabel: "취소",
      onCancel: Get.back,
    ));
  }
}
