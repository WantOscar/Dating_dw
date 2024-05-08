import 'package:dating/controller/login_controller.dart';
import 'package:dating/screen/auth/login_screen.dart';
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
}
