import 'package:dating/controller/resister_controller.dart';
import 'package:dating/data/provider/auth_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class ResisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ResisterController(service: AuthService()));
  }
}
