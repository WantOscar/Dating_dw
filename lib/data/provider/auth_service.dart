import 'package:dating/binding/home_binding.dart';
import 'package:dating/data/model/token_provider.dart';
import 'package:dating/screen/auth/login_screen.dart';
import 'package:dating/screen/auth/onboard_screen.dart';
import 'package:dating/utils/api_urls.dart';
import 'package:dating/utils/dio_intercepter.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  final TokenProvider tokenProvider = TokenProvider();
  final Dio dio = Dio(BaseOptions(
    baseUrl: ApiUrl.baseUrl,
  ))
    ..interceptors.add(BaseIntercepter());

  /// 로그인 메소드
  /// 로그인에 성공하면 서버로부터 JWT 토큰을 받고
  /// 로컬 스토리지에 저장됨
  /// 실패할 경우 에러메시지를 반환함.
  Future<void> login(Map<String, dynamic> data) async {
    try {
      final response = await dio.post(ApiUrl.login, data: data);
      if (response.statusCode == 200) {
        tokenProvider.saveTokenInfo(response.data);
        Get.off(() => const OnboardScreen(), binding: HomeBinding());
      }
    } on Exception {
      return;
    }
  }

  /// 회원가입 메소드
  /// 회원가입에 성공하면
  /// 회원정보를 반환
  /// 회원가입에 실패하면
  /// 에러메시지 반환
  Future<String?> signUp(Map<String, dynamic> json) async {
    try {
      final response = await dio.post(
        ApiUrl.signUp,
        data: json,
      );
      if (response.statusCode == 200) {
        return "회원가입에 성공했습니다!";
      }
    } on Exception {
      return null;
    }
    return null;
  }

  /// 로그아웃 메소드
  /// 로그아웃을 시도하는 경우
  /// 저장된 토큰을 삭제함.
  /// 삭제 후 로그인화면으로 이동함.
  /// 실패한 경우 에러메시지를 사용자에게 보여줌.
  Future<void> logOut() async {
    print("토큰 삭제");
    tokenProvider.deleteTokenInfo();
    Get.offAll(() => const LoginScreen());
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
      dioExceptionHander(error);
      return null;
    } on Exception {
      Get.snackbar("에러 !", "잠시후에 다시 시도해주세요!");
    }
    return null;
  }

  void dioExceptionHander(DioException error) {
    switch (error.type) {
      case DioExceptionType.badResponse:
        Get.snackbar("로그인 실패!", "회원정보를 확인해주세요!");
        break;
      case DioExceptionType.connectionTimeout:
        Get.snackbar("네트워크 에러", "런타임 아웃 !");
        break;
      default:
        Get.snackbar("에러", "에러가 발생했습니다!");
        break;
    }
  }

  /// 사용자 로그인 정보 무결성 검증 및 새 엑세스 토큰 발급 메소드
  /// 사용자의 리프레시 토큰이 만료된 경우
  /// 강제로 로그아웃됨.
  /// 리프레시 토큰이 유효한 경우 새 엑세스 토큰을 발급 후 저장.
  Future<bool> refreshToken(String refreshToken) async {
    try {
      final response = await dio.post("/refresh",
          options: Options(headers: {"refreshToken": "Bearer $refreshToken"}));
      if (response.statusCode == 200) {
        await tokenProvider.saveAccessToken(response.data["accessToken"]);
        return true;
      } else {
        return false;
      }
    } on Exception {
      return false;
    }
  }
}
