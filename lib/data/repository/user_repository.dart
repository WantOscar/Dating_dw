import 'package:dating/data/model/user.dart';
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
        .patch("/member/profile", data: user.toJson())
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

  /// 메인 화면 데이터 Get Api
  @override
  Future<Map<String, dynamic>> getHomeDatas() {
    return dio.get("/").then((response) => response.data);
  }

  @override
  Future<List<Map<String, dynamic>>> newFavoriteMembers(int id) {
    return dio
        .get("/favorite-list/$id")
        .then((response) => List<Map<String, dynamic>>.from(response.data));
  }

  @override
  Future<void> heartAdd(int id) async {
    final response = await dio.post("/heart/add", queryParameters: {"id": id});
    if (response.statusCode != 200) {
      throw Exception();
    }
  }

  @override
  Future<void> postMemberBlock(int id) async {
    return dio.post("/member/block/$id").then((response) => response.data);
  }

  @override
  Future<void> postMemberNonBlock(int id) async {
    return dio.post("/member/nonblock/$id").then((response) => response.data);
  }

  @override
  Future<List<User>> getMemberBlockList() async {
    return dio.get("/member/block").then((response) =>
        List.from(response.data).map((json) => User.fromJson(json)).toList());
  }
}

abstract class UserRepository {
  Future<User> searchMyInfo();

  Future<List<String>> uploadImage(FormData data);

  Future<User> updateUserInfo(User user);

  Future<User> getUser(Map<String, dynamic> nickName);

  Future<String> postSettingPassword(Map<String, dynamic> data);

  Future<Map<String, dynamic>> getHomeDatas();

  Future<List<Map<String, dynamic>>> newFavoriteMembers(int id);

  Future<void> heartAdd(int id);

  Future<void> postMemberBlock(int id);

  Future<void> postMemberNonBlock(int id);

  Future<List<User>> getMemberBlockList();
}
