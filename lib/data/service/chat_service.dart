import 'package:dio/dio.dart';

class ChatService {
  final Dio dio;
  ChatService({required this.dio});

  Future<String> makeChattingRoom(int memberId, String accessToken) async {
    final response = await dio.post(
        "http://13.124.21.82:8082/chat/create/$memberId",
        options: Options(headers: {"Authorization": "Bearer $accessToken"}));
    if (response.statusCode == 200) {
      return response.data["chatRoomId"];
    } else {
      print("Error");
      return "Error";
    }
  }
}
