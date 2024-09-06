import 'package:dating/controller/bottom_nav_controller.dart';
import 'package:dating/controller/chat_controller.dart';
import 'package:dating/controller/feed_controller.dart';
import 'package:dating/controller/main_controller.dart';
import 'package:dating/controller/member_block_controller.dart';
import 'package:dating/controller/setting_password_controller.dart';
import 'package:dating/data/repository/feed_repository.dart';
import 'package:dating/data/repository/home_repository.dart';
import 'package:dating/data/repository/member_block_respository.dart';
import 'package:dating/data/repository/user_repository.dart';
import 'package:dating/data/service/chat_service.dart';
import 'package:dating/data/service/home_service.dart';
import 'package:dating/utils/api_urls.dart';
import 'package:dating/utils/dio_intercepter.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController());

    Get.put(ChatController(
        service: ChatServiceImpl(
            dio: Dio(BaseOptions(baseUrl: ApiUrl.baseUrl))
              ..interceptors.add(AuthInterceptor())
              ..interceptors.add(BaseIntercepter()))));

    Get.put(FeedController(
        feedRepository: FeedRepositoryImpl(
            dio: Dio(BaseOptions(
      baseUrl: ApiUrl.baseUrl,
    ))
              ..interceptors.add(AuthInterceptor())
              ..interceptors.add(BaseIntercepter()))));

    Get.put(
      MainController(
          homeService: HomeService(
              homeRepository: HomeRepositoryImpl(
                  dio: Dio(BaseOptions(baseUrl: ApiUrl.baseUrl))
                    ..interceptors.add(AuthInterceptor())
                    ..interceptors.add(BaseIntercepter())))),
    );

    Get.put(MemberBlockController(
        memberBlockRespository: MemberBlockRespository(
            dio: Dio(BaseOptions(baseUrl: ApiUrl.baseUrl))
              ..interceptors.add(AuthInterceptor())
              ..interceptors.add(BaseIntercepter()))));

    Get.put(SettingPasswordController(
        userRepository: UserRepositoryImpl(
            dio: Dio(BaseOptions(baseUrl: ApiUrl.baseUrl))
              ..interceptors.add(AuthInterceptor())
              ..interceptors.add(BaseIntercepter()))));
  }
}
