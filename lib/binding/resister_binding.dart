import 'package:dating/controller/email_verify_controller.dart';
import 'package:dating/controller/resister_controller.dart';
import 'package:dating/data/service/auth_service.dart';
import 'package:get/get.dart';

class ResisterBinding implements Bindings {
  @override
  void dependencies() {
    AuthService authService = AuthService();
    Get.put(EmailVerifyController(service: authService));
    Get.put(ResisterController(service: authService));
  }
}
