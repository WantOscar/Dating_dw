import 'package:dating/controller/login_controller.dart';
import 'package:dating/controller/user_controller.dart';
import 'package:dating/data/provider/auth_service.dart';
import 'package:dating/data/provider/user_fetch.dart';
import 'package:dating/data/repository/user_repository.dart';
import 'package:get/get.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController(authService: AuthService()));
    Get.put(
        UserController(userRepository: UserRepository(service: UserFetch())),
        permanent: true);
  }
}
