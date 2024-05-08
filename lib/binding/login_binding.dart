import 'package:dating/controller/login_controller.dart';
import 'package:dating/data/model/token_provider.dart';
import 'package:dating/data/provider/auth_service.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController(authService: AuthService()));
  }
}
