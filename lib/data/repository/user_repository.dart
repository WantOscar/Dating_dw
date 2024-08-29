import 'package:dating/data/model/user.dart';
import 'package:dating/utils/api_urls.dart';
import 'package:dio/dio.dart';
import 'package:get/state_manager.dart';

class UserRepositoryImpl extends GetxService implements UserRepository {
  final Dio dio;

  UserRepositoryImpl({required this.dio});

  /// 내 정보 조회 API
  /// 로그인된 사용자의 정보를 User로 반환함.
  @override
  Future<User> searchMyInfo() async {
    return dio
        .get("/member/profile")
        .then((response) => User.fromJson(response.data));
  }

  /// 이미지 업로드 API
  /// 이미지를 S3에 업로드 후 URL을 반환함.
  @override
  Future<List<String>> uploadImage(FormData data) async {
    return dio.post("/images/s3-upload", data: data, queryParameters: {
      "type": "profile",
    }).then((response) => List<String>.from(response.data["imageList"]));
  }

  /// 사용자 정보 갱신 API
  /// 로그인한 사용자의 정보를 수정한 후,
  /// 갱신된 USER를 반환함.
  @override
  Future<User> updateUserInfo(User user) async {
    return dio
        .post("/member/profile/save", data: user.toJson())
        .then((response) => User.fromJson(response.data));
  }

  /// 사용자 정보 조회 API
  /// 닉네임을 통해 사용자를 조회하여
  /// 조회된 USER를 반환함.
  @override
  Future<User> getUser(Map<String, dynamic> nickName) async {
    return dio
        .get("/member/profile/another/nick-name", queryParameters: nickName)
        .then((response) => User.fromJson(response.data));
  }

  /// 사용자 비밀번호 변경 API
  /// 로그인한 사용자의 비밀번호를 변경한 후
  /// 결과 메시지를 반환함.
  @override
  Future<String> postSettingPassword(Map<String, dynamic> data) async {
    return dio
        .post(
          "/setting/password",
          data: data,
        )
        .then((response) => response.data["successMessage"]);
  }
}

abstract class UserRepository {
  Future<User> searchMyInfo();

  Future<List<String>> uploadImage(FormData data);

  Future<User> updateUserInfo(User user);

  Future<User> getUser(Map<String, dynamic> nickName);

  Future<String> postSettingPassword(Map<String, dynamic> data);
}
