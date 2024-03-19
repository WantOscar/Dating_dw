import 'package:dating/screen/auth/login_screen.dart';
import 'package:dating/utils/api_urls.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AuthService {
  final Dio dio;
  final FlutterSecureStorage storage;

  AuthService({required this.dio, required this.storage});

  /// 로그인 메소드
  /// 로그인에 성공하면 서버로부터 JWT 토큰을 받고
  /// 로컬 스토리지에 저장됨
  /// 실패할 경우 에러메시지를 반환함.
  Future<void> login(Map<String, dynamic> data) async {
    try {
      final response = await dio.post(ApiUrl.login, data: data);
      if (response.statusCode == 200) {
        const st = FlutterSecureStorage();
        st.write(key: "token", value: response.data["accessToken"]);
      }
    } on DioException catch (error) {
      switch (error.type) {
        case DioExceptionType.badResponse:
          Get.snackbar("네트워크 에러", "서버와의 연결이 원할하지 않습니다 !");
          break;
        default:
          Get.snackbar("에러", "에러가 발생했습니다!");
      }
    }
  }

  /// 회원가입 메소드
  /// 회원가입에 성공하면
  /// 회원정보를 반환
  /// 회원가입에 실패하면
  /// 에러메시지 반환
  Future<void> signUp(Map<String, dynamic> json) async {
    try {
      final response = await dio.post(
        ApiUrl.login,
        data: json,
      );

      if (response.statusCode == 200) {
        print("회원가입에 성공했습니다 !");
      } else {
        print(response.data["errorMessage"]);
      }
    } catch (e) {
      Get.snackbar('회원가입실패', '회원정보를 다시 확인해주세요!');
    }
  }

  /// 로그아웃 메소드
  /// 로그아웃을 시도하는 경우
  /// 저장된 토큰을 삭제함.
  /// 삭제 후 로그인화면으로 이동함.
  /// 실패한 경우 에러메시지를 사용자에게 보여줌.
  Future<void> logOut() async {
    try {
      print("토큰 삭제");
      await storage.delete(key: "token");
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      Get.snackbar('로그아웃에 실패하였습니다!', '잠시후 다시 시도해주세요');
    }
  }

  /// 이메일 인증 메소드
  /// 이메일을 통해 인증 번호를 전송해줌
  Future<String?> emailVerify(Map<String, dynamic> json) async {
    try {
      final response = await dio.post(ApiUrl.emailVerify, data: json);
      if (response.statusCode == 200) {
        return response.data["code"];
      } else {
        return null;
      }
    } on DioException catch (error) {
      switch (error.type) {
        case DioExceptionType.badResponse:
          Get.snackbar("네트워크 에러", "서버와의 연결이 원할하지 않습니다 !");
          break;
        default:
          Get.snackbar("에러", "에러가 발생했습니다!");
      }
    }
    return null;
  }
}
