import 'package:dating/data/service/auth_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_connect/http/src/request/request.dart';

void main() {
  final service = AuthService();
  group("Auth Service Unit Test", () {
    test("이메일 인증 테스트", () async {
      final request = {"email": "qazws78941@naver.com"};
      final result = await service.emailVerify(request);

      expect(result.length, 6);
    });

    test("이메일 인증 실패 테스트", () async {
      final request = {"email": ""};

      expect(() => service.emailVerify(request), throwsA(isA<Exception>()));
    });
  });
}
