import 'package:dating/controller/bottom_nav_controller.dart';

import 'package:dating/controller/onboard_controller.dart';
import 'package:dating/controller/user_controller.dart';
import 'package:dating/data/provider/chat_service.dart';
import 'package:dating/data/provider/user_fetch.dart';
import 'package:dating/data/repository/user_repository.dart';
import 'package:dio/dio.dart';

import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(OnboardingController());
    Get.put(
        UserController(
            userRepository: UserRepository(service: UserFetch(dio: Dio()))),
        permanent: true);
    Get.put(BottomNavController(), permanent: true);
  }
}
