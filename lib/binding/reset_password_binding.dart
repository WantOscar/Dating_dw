import 'package:dating/controller/email_verify_controller.dart';
import 'package:dating/data/service/auth_service.dart';
import 'package:get/get.dart';

class ResetPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(EmailVerifyController(service: AuthService()));
  }
}
