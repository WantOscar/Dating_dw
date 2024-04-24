import 'package:dating/controller/login_controller.dart';
import 'package:dating/data/provider/auth_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController(
        service: AuthService(storage: const FlutterSecureStorage())));
  }
}
