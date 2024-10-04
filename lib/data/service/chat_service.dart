import 'package:dating/data/model/chatting_room_model.dart';
import 'package:dating/data/model/message_model.dart';
import 'package:dio/dio.dart';
import 'package:get/state_manager.dart';

class ChatServiceImpl extends GetxService implements ChatService {
  final Dio dio;

  ChatServiceImpl({required this.dio});

  /// 1:1채팅방 생성 API
  /// 로그인한 사용자가 원하는 상대방에게 채팅을 신청하는 API
  /// 채팅 신청이 성공하면 채팅방 ID를 반환함.
  @override
  Future<int> makeChattingRoom(int memberId, String type) async {
    return dio.post("/chat/create/$memberId", queryParameters: {
      "type": type,
    }).then((response) => response.data["chatRoomId"]);
  }

  /// 채팅방 조회 API
  /// 로그인한 사용자가 포함된 모든 채팅방을 조회하여
  /// CHATTING_ROOM_MODEL 배열로 반환함.
  @override
  Future<List<ChattingRoomModel>> getMyPersonalChattingList() async {
    return dio.get("/chat/list", queryParameters: {"type": "dm"}).then(
        (response) => List<ChattingRoomModel>.from(response.data["chatRoomList"]
            .map((json) => ChattingRoomModel.fromJson(json))).toList());
  }

  /// 채팅방 조회 API
  /// 로그인한 사용자가 포함된 모든 채팅방을 조회하여
  /// CHATTING_ROOM_MODEL 배열로 반환함.
  @override
  Future<List<ChattingRoomModel>> getMyMeetingChattingList() async {
    return dio.get("/chat/list", queryParameters: {"type": "meeting"}).then(
        (response) => List<ChattingRoomModel>.from(response.data["chatRoomList"]
            .map((json) => ChattingRoomModel.fromJson(json))).toList());
  }

  /// 채팅방 메시지 조회 API
  /// 로그인한 사용자가 특정 채팅방 메시지를 전체 조회하는 API
  /// MessageModel 배열을 반환함.
  @override
  Future<List<MessageModel>> getMessages(int chatRoomId) async {
    return dio.get("/chat/$chatRoomId").then((response) =>
        List<MessageModel>.from(response.data["messages"]
            .map((json) => MessageModel.fromJson(json))).toList());
  }

  /// FCM 요청 API
  @override
  void sendPushNotification(Map<String, dynamic> data) {
    dio.post("/fcm", data: data);
  }

  @override
  void readChat(int id) async {
    await dio.post("/chat/is-read/$id");
  }
}

abstract class ChatService {
  Future<int> makeChattingRoom(int id, String type);

  Future<List<ChattingRoomModel>> getMyPersonalChattingList();

  Future<List<ChattingRoomModel>> getMyMeetingChattingList();

  Future<List<MessageModel>> getMessages(int chatRoomId);

  void sendPushNotification(Map<String, dynamic> data);

  void readChat(int id) {}
}
