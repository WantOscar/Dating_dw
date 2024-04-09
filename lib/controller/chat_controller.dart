import 'package:dating/data/model/chat.dart';
import 'package:dating/data/provider/chat_service.dart';
import 'package:dating/screen/chat/chatting_room_screen.dart';
import 'package:dating/utils/api_urls.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final ChatService service;
  static ChatController get to => Get.find();
  ChatController({required this.service});
  void makeChattingRoom(int memberId) async {
    final token = await const FlutterSecureStorage().read(key: "accessToken");
    if (token == null) {
      print("토큰 갱신 필요");
      return;
    }

    /// 채팅방 생성 api
    final chatRoomId = await service.makeChattingRoom(memberId, token);
    if (chatRoomId == "Error") {
      print("서버 통신 에러");
      return;
    }
    moveToChattingRoom(chatRoomId);

    /// 채팅방 생성
  }

  void moveToChattingRoom(String chatRoomId) {
    Get.to(() => ChattingRoom(chatRoomId: chatRoomId));
  }

  void sendMessage(String message) {
    final data = {
      "messageType": "TALK",
      "memberId": "1",
      "chatRoomId": "1",
      "message": message
    };
  }
}
