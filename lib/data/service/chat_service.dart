import 'package:dating/data/model/chatting_room_model.dart';
import 'package:dating/data/model/token_provider.dart';
import 'package:dating/utils/api_urls.dart';
import 'package:dating/utils/dio_intercepter.dart';
import 'package:dio/dio.dart';

class ChatService {
  final TokenProvider tokenProvider = TokenProvider();
  final Dio dio = Dio(BaseOptions(baseUrl: ApiUrl.baseUrl))
    ..interceptors.add(AuthInterceptor())
    ..interceptors.add(BaseIntercepter());

  Future<int> makeChattingRoom(int memberId) async {
    final response = await dio
        .post("/chat/create/$memberId", queryParameters: {"type": "dm"});
    if (response.statusCode == 200) {
      return response.data["chatRoomId"];
    } else {
      throw Exception();
    }
  }

  Future<List<ChattingRoomModel>?> getMyChattingList() async {
    final response =
        await dio.get("/chat/list", queryParameters: {"type": "dm"});
    if (response.statusCode == 200) {
      final List<ChattingRoomModel> result = [];
      for (var json in response.data["chatRoomList"]) {
        final chatRoom = ChattingRoomModel.fromJson(json);
        result.add(chatRoom);
      }
      return result;
    } else {
      return null;
    }
  }

  void sendPushNotification(Map<String, dynamic> data) {
    dio.post("/fcm", data: data);
  }
}
