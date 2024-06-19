import 'package:dating/data/model/token_provider.dart';
import 'package:dating/data/repository/auth_repository.dart';
import 'package:dating/screen/auth/login_screen.dart';
import 'package:dating/utils/api_urls.dart';
import 'package:dating/utils/dio_intercepter.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AuthService implements AuthRepository {
  final TokenProvider tokenProvider = TokenProvider();
  late final Dio dio = Dio(BaseOptions(baseUrl: ApiUrl.baseUrl))
    ..interceptors.add(BaseIntercepter());

  /// 회원가입 메소드
  /// 회원가입에 성공하면
  /// 회원정보를 반환
  /// 회원가입에 실패하면
  /// 에러메시지 반환
  @override
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

  /// 로그인 메소드
  /// 로그인에 성공하면 서버로부터 JWT 토큰을 받고
  /// 로컬 스토리지에 저장됨
  /// 실패할 경우 에러메시지를 반환함.
  @override
  Future<String?> login(Map<String, dynamic> data) async {
    try {
      final response = await dio.post(ApiUrl.login, data: data);
      if (response.statusCode == 200) {
        await tokenProvider.saveTokenInfo(response.data);
        return tokenProvider.getAccessToken();
      } else {
        return null;
      }
    } on Exception catch (error) {
      return null;
    }
  }

  /// 로그아웃 메소드
  /// 로그아웃을 시도하는 경우
  /// 저장된 토큰을 삭제함.
  /// 삭제 후 로그인화면으로 이동함.
  /// 실패한 경우 에러메시지를 사용자에게 보여줌.
  @override
  Future<void> logOut() async {
    final response = await dio.post(ApiUrl.logout,
        options: Options(headers: {
          "Authorization": tokenProvider.getAccessToken(),
        }));
    if (response.statusCode == 200) {
      tokenProvider.deleteTokenInfo();
      Get.offAll(() => const LoginScreen());
    } else {
      print('로그아웃');
    }
  }

  /// 회원탈퇴 메소드
  /// 회원탈퇴를 시도하는 경우
  /// 저장된 토큰을 삭제.
  /// 삭제 후 로그인 화면으로 이동.
  /// 실패할 겨웅 에러 메시지를 사용자에게 보여줌.
  @override
  Future<void> delete() async {
    final response = await dio.delete(ApiUrl.delete);
    if (response.statusCode == 200) {
      tokenProvider.deleteTokenInfo();
      Get.offAll(() => const LoginScreen());
    } else {
      print('회원탈퇴');
    }
  }

  /// 이메일 인증 메소드
  /// 초기 가입하는 사용자는 본인의 가입 이메일을 입력함
  /// 그 이메일을 통해 인증 번호를 전송해줌
  @override
  Future<String?> emailVerify(Map<String, dynamic> email) async {
    try {
      final response =
          await dio.post(ApiUrl.emailVerify, queryParameters: email);
      if (response.statusCode == 200) {
        return response.data["code"];
      } else {
        return null;
      }
    } on Exception {
      return null;
    }
  }
}
