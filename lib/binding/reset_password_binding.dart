import 'package:dating/controller/reset_password_controller.dart';
import 'package:dating/data/provider/auth_service.dart';

import 'package:get/get.dart';

class ResetPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ResetPasswordController(service: AuthService()));
  }
}
