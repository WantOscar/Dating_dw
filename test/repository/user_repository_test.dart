import 'package:dating/data/repository/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<Dio>()])
import "user_repository_test.mocks.dart";

void main() {
  var dio = MockDio();
  final UserRepository userRepository = UserRepository();
  group("User Repsitory Unit Test", () {
    test("특정 유저 정보를 조회테스트", () async {
      final query = {"nickName": "string"};

      final json = {
        "nickName": "string",
        "description": "string",
        "birthDay": "2024-08-22",
        "address": "string",
        "gender": "string",
        "age": 0,
        "height": 0,
        "images": ["string"],
        "image": "string",
        "personalInfo": "string",
        "personality": "string",
        "interest": "string",
        "likePersonality": "string"
      };

      when(dio.get("/member/profile/another/nick-name", queryParameters: query))
          .thenAnswer((_) async => Response(
              statusCode: 200, data: json, requestOptions: RequestOptions()));

      final result = await userRepository.getUser(query, d: dio);

      verify(dio.get("/member/profile/1"));
      expect(result.nickName, "string");
    });
  });
}
