import 'package:dating/data/model/feed.dart';
import 'package:dating/utils/api_urls.dart';
import 'package:dating/utils/dio_intercepter.dart';
import 'package:dio/dio.dart';

class FeedRepository {
  final dio = Dio(BaseOptions(
    baseUrl: ApiUrl.baseUrl,
  ))
    ..interceptors.add(BaseIntercepter());

  /// 글 상세 조회를 위한 함수
  Future<Feed?> getFeed(int id) async {
    final response = await dio.get('/search/$id');

    if (response.statusCode == 200) {
      return Feed.fromJson(response.data);
    } else {
      return null;
    }
  }

  /// 글 전체 조회를 위한 함수
  Future<List<Feed>?> getAllFeeds() async {
    final response = await dio.get('/search');

    if (response.statusCode == 200) {
      final List feeds = response.data;
      return feeds.map((json) => Feed.fromJson(json)).toList();
    } else {
      return null;
    }
  }

  /// 글 쓰기를 위한 함수
  Future<Feed?> postFeed(Map<String, dynamic> data) async {
    final response = await dio.post('/search', data: data);
    if (response.statusCode == 201) {
      return Feed.fromJson(response.data);
    } else {
      return null;
    }
  }
}
