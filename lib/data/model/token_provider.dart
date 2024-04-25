import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// 토큰 관리를 위해 생성한
/// 싱글톤 패턴의 토큰 프로바이더 클래스
class TokenProvider {
  final storage = const FlutterSecureStorage();
  final String _accessToken = "accessToken";
  final String _refreshToken = "refreshToken";
  TokenProvider._privateConstructor();
  static final TokenProvider _instance = TokenProvider._privateConstructor();

  factory TokenProvider() => _instance;

  /// 서버로부터 발급받은 토큰을 스토리지에 저장하는 메소드
  void saveTokenInfo(Map<String, dynamic> json) {
    storage.write(key: _accessToken, value: json[_accessToken]);
    storage.write(key: _refreshToken, value: json[_refreshToken]);
  }

  /// 스토리지에 저장된 액세스 토큰 정보를 전달하는 메소드
  /// 토큰 정보가 없는 경우 빈 값이 전달됨.
  Future<String> getAccessToken() async {
    return await storage.read(key: _accessToken) ?? "";
  }

  /// 갱신된 액세스 토큰을 저장하는 메소드
  Future<void> saveAccessToken(String newAccessToken) async {
    storage.write(key: _accessToken, value: newAccessToken);
  }

  /// 스토리지에 저장된 리프레시 토큰을 전달하는 메소드
  /// 토큰 정보가 없는 경우 빈 값이 전달됨.
  Future<String> getRefreshToken() async {
    return await storage.read(key: _refreshToken) ?? "";
  }

  /// 스토리지에 저장된 토큰 정보를 삭제하는 메소드
  void deleteTokenInfo() {
    storage.delete(key: _accessToken);
    storage.delete(key: _refreshToken);
  }
}
