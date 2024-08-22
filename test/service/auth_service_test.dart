import 'package:dating/data/service/auth_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Auth Service Unit Test", () {
    test("이메일 인증 테스트", () async {
      final service = AuthService();
      final request = {"email": "qazws78941@naver.com"};
      final result = await service.emailVerify(request);

      expect(result!.length, 6);
    });
  });
}
