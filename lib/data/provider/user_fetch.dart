import 'package:dating/data/model/main_response.dart';
import 'package:dating/data/model/user.dart';
import 'package:dating/utils/api_urls.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as storage;

class UserFetch {
  final Dio dio;
  UserFetch({required this.dio});

  Future<MainResponse?> fetchUserData() async {
    const st = storage.FlutterSecureStorage();
    final access = await st.read(key: "accessToken");
    final refresh = await st.read(key: "refreshToken");

    return dio
        .get(ApiUrl.main,
            options: Options(headers: {
              "Authorization": "Bearer $access",
              "refreshToken": "Bearer $refresh"
            }))
        .then((resp) {
      // print(resp.data);
      // return null;
      final MainResponse response = MainResponse.fromJson(resp.data);
      return response;
      // if (resp.statusCode == 200) {
      //   final List<MainResponse> users = [];
      //   for (var data in resp.data) {
      //     print(data);
      //     // final MainResponse user = MainResponse.fromJson(data);
      //     // users.add(user);
      //   }
      //   return users;
      // } else {
      //   throw Exception("Failed to send User data..");
      // }
    });
  }

  Future<User> searchMyInfo() async {
    const st = storage.FlutterSecureStorage();
    final token = await st.read(key: "token");

    return dio
        .get(ApiUrl.profile,
            options: Options(headers: {"Authorization": "Bearer $token"}))
        .then((resp) {
      if (resp.statusCode == 200) {
        return User.fromJson(resp.data);
      } else {
        throw Exception("Failed to send User data..");
      }
    });
  }
}
