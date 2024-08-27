import 'package:dating/data/model/user.dart';
import 'package:dating/utils/api_urls.dart';
import 'package:dio/dio.dart';
import 'package:get/state_manager.dart';

class UserRepository extends GetxService {
  final Dio dio;

  UserRepository({required this.dio});

  Future<User> searchMyInfo() async {
    return dio
        .get("/member/profile")
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
        .then((response) => User.fromJson(response.data));
  }

  Future<User> getUser(Map<String, dynamic> nickName) async {
    return dio
        .get("/member/profile/another/nick-name", queryParameters: nickName)
        .then((response) => User.fromJson(response.data));
  }

  /// 사용자 비밀번호 변경 인터페이스
  Future<String> postSettingPassword(Map<String, dynamic> data) async {
    return dio
        .post(
          "/setting/password",
          data: data,
        )
        .then((response) => response.data["successMessage"]);
  }
}
