import 'package:dating/controller/bottom_nav_controller.dart';
import 'package:dating/controller/chat_controller.dart';
import 'package:dating/controller/email_verify_controller.dart';
import 'package:dating/controller/feed_controller.dart';
import 'package:dating/controller/main_controller.dart';
import 'package:dating/controller/member_block_controller.dart';
import 'package:dating/controller/setting_password_controller.dart';
import 'package:dating/data/repository/feed_repository.dart';
import 'package:dating/data/repository/user_repository.dart';
import 'package:dating/data/service/auth_service.dart';
import 'package:dating/data/service/chat_service.dart';
import 'package:dating/data/service/user_service.dart';
import 'package:dating/utils/api_urls.dart';
import 'package:dating/utils/dio_intercepter.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    final Dio dio = Dio(BaseOptions(baseUrl: ApiUrl.baseUrl))
      ..interceptors.add(AuthInterceptor())
      ..interceptors.add(BaseIntercepter());
    final UserRepositoryImpl userRepository = UserRepositoryImpl(dio: dio);
    final ChatServiceImpl chatService = ChatServiceImpl(dio: dio);
    final FeedRepositoryImpl feedRepository = FeedRepositoryImpl(dio: dio);
    final UserService userService = UserService(userRepository: userRepository);

    Get.put(BottomNavController());

    Get.put(ChatController(service: chatService));

    Get.put(FeedController(feedRepository: feedRepository));

    Get.put(
      MainController(userService: userService),
    );

    Get.put(MemberBlockController(userRepository: userRepository));

    Get.put(SettingPasswordController(userRepository: userRepository));

    Get.put(EmailVerifyController(service: AuthService()));
  }
}
