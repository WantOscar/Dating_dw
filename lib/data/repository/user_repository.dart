import 'package:dating/data/model/user.dart';
import 'package:dating/utils/api_urls.dart';
import 'package:dating/utils/dio_intercepter.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;

class UserRepository extends g.GetxService {
  final Dio dio = Dio(BaseOptions(baseUrl: ApiUrl.baseUrl))
    ..interceptors.add(AuthInterceptor())
    ..interceptors.add(BaseIntercepter());

  Future<User> searchMyInfo() async {
    return dio
        .get(ApiUrl.profile)
        .then((response) => User.fromJson(response.data));
  }

  Future<List<String>> uploadImage(FormData data) async {
    return dio.post("/images/s3-upload", data: data, queryParameters: {
      "type": "profile",
    }).then((response) => List<String>.from(response.data["imageList"]));
  }

  Future<User> updateUserInfo(Map<String, dynamic> data) async {
    return dio
        .post("/member/profile/save", data: data)
        .then((response) => response.data);
  }

  Future<User> getUser(Map<String, dynamic> nickName, {Dio? d}) async {
    d ??= dio;

    return d
        .get("/member/profile/another/nick-name", queryParameters: nickName)
        .then((response) => User.fromJson(response.data));
  }
}
