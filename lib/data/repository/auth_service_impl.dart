import 'package:get/get.dart';

abstract class AuthServiceImpl {
  /// 사용자 로그인 인터페이스
  Future<void> login(Map<String, dynamic> data);

  /// 사용자 로그아웃 인터페이스
  Future<void> logOut();

  /// 사용자 회원 탈퇴 인터페이스
  Future<void> delete();

  /// 사용자 회원가입 인터페이스
  Future<String?> signUp(Map<String, dynamic> data);

  /// 이메일 인증 인터페이스
  Future<String?> emailVerify(Map<String, dynamic> email);

  /// 사용자 FCM 토큰 갱신
  Future<void> updateFCMtoken(String token, String accessToken);
}
