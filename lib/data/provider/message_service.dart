import 'package:dating/data/model/message_model.dart';
import 'package:dating/utils/api_urls.dart';
import 'package:dating/utils/dio_intercepter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class MessageService extends GetxService {
  final Dio dio = Dio(BaseOptions(
    baseUrl: ApiUrl.baseUrl,
  ))
    ..interceptors.add(AuthInterceptor())
    ..interceptors.add(BaseIntercepter());

  final FlutterSecureStorage storage;
  MessageService({required this.storage});

  Future<List<MessageModel>?> getMessages(int chatRoomId) async {
    try {
      final messages = await dio.get("/chat/$chatRoomId");

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
