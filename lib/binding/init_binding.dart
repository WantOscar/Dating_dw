import 'package:dating/controller/login_controller.dart';
import 'package:dating/controller/upload_controller.dart';
import 'package:dating/data/provider/auth_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(UserController(
    //     userRepository: UserRepository(service: UserFetch(dio: Dio()))));
    Get.put(LoginController(
        service:
            AuthService(dio: Dio(), storage: const FlutterSecureStorage())));
    Get.put(UploadController(picker: ImagePicker()));
  }
}
