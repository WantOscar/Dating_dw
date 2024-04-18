import 'package:dating/data/model/message_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class MessageService extends GetxService {
  final Dio dio;
  final FlutterSecureStorage storage;
  MessageService({required this.dio, required this.storage});

  Future<List<MessageModel>?> getMessages(int chatRoomId) async {
    try {
      final token = await storage.read(key: "accessToken");
      final messages = await dio.get(
          "http://13.124.21.82:8082/chat/$chatRoomId",
          options: Options(headers: {"Authorization": "Bearer $token"}));
      if (messages.statusCode == 200) {
        List<MessageModel> messages0 = [];
        for (var data in messages.data["chatOneDtoList"]) {
          MessageModel message = MessageModel.fromJson(data);
          messages0.add(message);
        }
        return messages0;
      } else {
        return [];
      }
    } on Exception catch (e) {
      print(e);
    }
    return null;
  }
}
