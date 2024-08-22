import 'package:dating/data/model/user.dart';
import 'package:dating/utils/api_urls.dart';
import 'package:dating/utils/dio_intercepter.dart';
import 'package:dio/dio.dart';

class UserRepository {
  final Dio dio = Dio(BaseOptions(baseUrl: ApiUrl.baseUrl))
    ..interceptors.add(AuthInterceptor())
    ..interceptors.add(BaseIntercepter());

  Future<User?> searchMyInfo() async {
    try {
      final response = await dio.get(
        ApiUrl.profile,
      );

      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      }
    } on Exception {
      return null;
    }
    return null;
  }

  Future<List<String>> uploadImage(FormData data) async {
    try {
      final response =
          await dio.post("/images/s3-upload", data: data, queryParameters: {
        "type": "profile",
      });

      if (response.statusCode == 201) {
        print(response.data);
        return List<String>.from(response.data["imageList"]);
      } else {
        return [];
      }
    } on Exception catch (e) {
      print(e.toString());
    }
    return [];
  }

  updateUserInfo(Map<String, dynamic> data) async {
    try {
      final response = await dio.post("/member/profile/save", data: data);

      if (response.statusCode == 200) {
        print(response.data);
      }
    } on Exception {
      print("error");
    }
  }

  Future<User> getUser(Map<String, dynamic> nickName, {Dio? d}) async {
    d ??= dio;

    final response = await d.get("/member/profile/another/nick-name",
        queryParameters: nickName);
    if (response.statusCode == 200) {
      return User.fromJson(response.data);
    } else {
      throw Exception();
    }
  }
}
