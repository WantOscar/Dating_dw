import 'package:dating/data/repository/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([Dio])
import "user_repository_test.mocks.dart";

void main() {
  late Dio dio;
  late UserRepository repository;

  setUp(() {
    dio = MockDio();
    repository = UserRepository(dio: dio);
  });
  group("User Repository Unit Test", () {
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

      final result = await repository.getUser(query);

      verify(dio.get("/member/profile/another/nick-name",
              queryParameters: query))
          .called(1);
      expect(result.nickName, "string");
    });

    test("특정 유저 정보 조회 실패 테스트", () async {
      final query = {"nickName": "string"};

      when(dio.get("/member/profile/another/nick-name", queryParameters: query))
          .thenThrow(DioException(
              requestOptions: RequestOptions(baseUrl: ""),
              response: Response(
                  requestOptions: RequestOptions(path: ""),
                  statusCode: 400,
                  data: {})));

      expect(repository.getUser(query),
          throwsA(predicate((err) => err is DioException)));
    });

    test("내 정보 조회 테스트", () async {
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

      when(dio.get("/member/profile")).thenAnswer((_) async => Response(
          requestOptions: RequestOptions(baseUrl: ""),
          data: json,
          statusCode: 200));

      final result = await repository.searchMyInfo();
      verify(dio.get("/member/profile")).called(1);
      expect(result.nickName, "string");
    });

    test("내 정보 조회 실패 테스트", () async {
      when(dio.get("/member/profile")).thenThrow(DioException(
          requestOptions: RequestOptions(baseUrl: ""),
          response: Response(
              requestOptions: RequestOptions(baseUrl: ""),
              statusCode: 400,
              data: {})));

      expect(
          repository.searchMyInfo(),
          throwsA(predicate((err) =>
              err is DioException && err.response?.statusCode == 400)));
    });

    test("이미지 업로드 테스트", () async {
      final query = {"type": "profile"};
      final json = {"file": []};
      FormData data = FormData.fromMap(json);
      final res = {"imageList": []};
      when(
        dio.post("/images/s3-upload", data: data, queryParameters: query),
      ).thenAnswer((_) async => Response(
          requestOptions: RequestOptions(baseUrl: ""),
          statusCode: 201,
          data: res));

      final result = await repository.uploadImage(data);
      verify(dio.post("/images/s3-upload", data: data, queryParameters: query))
          .called(1);
      expect(result.isEmpty, true);
    });

    test("이미지 업로드 실패 테스트", () async {
      final query = {"type": "profile"};
      final json = {"file": []};
      FormData data = FormData.fromMap(json);
      when(dio.post("/images/s3-upload", data: data, queryParameters: query))
          .thenThrow(DioException(
              requestOptions: RequestOptions(baseUrl: ""),
              response: Response(
                  requestOptions: RequestOptions(baseUrl: ""),
                  statusCode: 400,
                  data: {})));

      expect(repository.uploadImage(data),
          throwsA(predicate((err) => err is DioException)));
    });

    test("유저 정보 수정 테스트", () async {
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
      when(dio.post("/member/profile/save", data: json)).thenAnswer((_) async =>
          Response(
              requestOptions: RequestOptions(baseUrl: ""),
              data: json,
              statusCode: 201));

      final result = await repository.updateUserInfo(json);
      verify(dio.post("/member/profile/save", data: json)).called(1);
      expect(result.nickName, "string");
    });

    test("사용자 정보 수정 실패 테스트", () async {
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

      when(dio.post("/member/profile/save", data: json)).thenThrow(DioException(
          requestOptions: RequestOptions(baseUrl: ""),
          response: Response(
              requestOptions: RequestOptions(baseUrl: ""),
              statusCode: 400,
              data: {})));

      expect(
          repository.updateUserInfo(json),
          throwsA(predicate((err) =>
              err is DioException && err.response?.statusCode == 400)));
    });

    test("사용자 비밀번호 변경 테스트", () async {
      final json = {
        "currentPassword": "string",
        "newPassword": "BN_0qA%asKH",
        "checkNewPassword": "string"
      };
      when(dio.post("/setting/password", data: json)).thenAnswer((_) async =>
          Response(
              requestOptions: RequestOptions(baseUrl: ""),
              statusCode: 200,
              data: {"successMessage": "성공!"}));
      final result = await repository.postSettingPassword(json);
      verify(dio.post("/setting/password", data: json)).called(1);
      expect(result, "성공!");
    });

    test("사용자 비밀번호 변경 실패 테스트", () async {
      final json = {
        "currentPassword": "string",
        "newPassword": "BN_0qA%asKH",
        "checkNewPassword": "string"
      };
      when(dio.post("/setting/password", data: json)).thenThrow(DioException(
          requestOptions: RequestOptions(baseUrl: ""),
          response: Response(
              requestOptions: RequestOptions(baseUrl: ""),
              statusCode: 400,
              data: {})));

      expect(repository.postSettingPassword(json),
          throwsA(predicate((err) => err is DioException)));
    });
  });
}
