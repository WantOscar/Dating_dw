import 'package:dating/data/repository/feed_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'feed_repository_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late Dio dio;
  late FeedRepositoryImpl repository;

  setUp(() {
    dio = MockDio();
    repository = FeedRepositoryImpl(dio: dio);
  });

  group("Feed Repository Unit Test", () {
    test("피드 전체 조회 테스트", () async {
      final response = [
        {"title": "string", "content": "string"},
        {"title": "string", "content": "string"},
        {"title": "string", "content": "string"},
      ];

      when(dio.get("/search")).thenAnswer((_) async => Response(
          requestOptions: RequestOptions(baseUrl: ""),
          statusCode: 200,
          data: response));

      final result = await repository.getAllFeeds();

      verify(dio.get("/search")).called(1);

      expect(result.length, 3);
    });

    test("피드 상세 조회", () async {
      final response = {
        "title": "string",
        "content": "string",
      };

      when(dio.get("/search/1")).thenAnswer((_) async => Response(
          requestOptions: RequestOptions(baseUrl: ""),
          statusCode: 200,
          data: response));

      final result = await repository.getFeed(1);

      verify(dio.get("/search/1")).called(1);

      expect(result.title, "string");
      expect(result.content, "string");
    });

    test("피드 생성 테스트", () async {
      final response = {
        "title": "string",
        "content": "string",
      };

      when(dio.post("/search", data: response)).thenAnswer((_) async =>
          Response(
              requestOptions: RequestOptions(baseUrl: ""),
              statusCode: 201,
              data: response));

      final result = await repository.postFeed(response);

      verify(dio.post("/search", data: response)).called(1);

      expect(result.title, "string");
    });
  });
}
