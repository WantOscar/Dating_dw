import 'package:dating/controller/chatting_room_controller.dart';
import 'package:dating/data/model/chatting_room_model.dart';
import 'package:dating/data/repository/user_repository.dart';
import 'package:dating/data/service/chat_service.dart';
import 'package:dating/utils/api_urls.dart';
import 'package:dating/utils/dio_intercepter.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ChatRoomControllerBinding implements Bindings {
  final ChattingRoomModel chat;
  final String targetName;
  ChatRoomControllerBinding({required this.chat, required this.targetName});

  @override
  void dependencies() {
    Get.put(ChattingRoomController(
        chat: chat,
        targetName: targetName,
        chatService: ChatServiceImpl(
            dio: Dio(BaseOptions(
          baseUrl: ApiUrl.baseUrl,
        ))
              ..interceptors.add(AuthInterceptor())
              ..interceptors.add(BaseIntercepter())),
        userRepository: UserRepositoryImpl(
            dio: Dio(BaseOptions(
          baseUrl: ApiUrl.baseUrl,
        ))
              ..interceptors.add(AuthInterceptor())
              ..interceptors.add(BaseIntercepter()))));
  }
}
