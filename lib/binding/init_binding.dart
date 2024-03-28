import 'package:dating/controller/bottom_nav_controller.dart';
import 'package:dating/controller/login_controller.dart';
import 'package:dating/controller/upload_controller.dart';
import 'package:dating/controller/user_controller.dart';
import 'package:dating/data/provider/auth_service.dart';
import 'package:dating/data/provider/user_fetch.dart';
import 'package:dating/data/repository/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(UserController(
        userRepository: UserRepository(service: UserFetch(dio: Dio()))));
    Get.put(LoginController(
        service:
            AuthService(dio: Dio(), storage: const FlutterSecureStorage())));
    Get.put(UploadController(picker: ImagePicker()));
    Get.put(BottomNavController());
  }
}
