import 'package:dating/data/provider/auth_service.dart';

abstract class AuthRepository {
  /// 사용자 로그인 인터페이스
  Future<void> login(Map<String, dynamic> data);

  /// 사용자 로그아웃 인터페이스
  Future<void> logOut();

  /// 사용자 회원가입 인터페이스
  Future<String?> signUp(Map<String, dynamic> data);

  /// 이메일 인증 인터페이스
  Future<String?> emailVerify(Map<String, dynamic> email);

  /// 사용자 토큰 갱신 인터페이스
  Future<bool> refreshToken(String refreshToken);
}
