import 'package:dating/data/model/feed.dart';
import 'package:dating/utils/api_urls.dart';
import 'package:dating/utils/dio_intercepter.dart';
import 'package:dio/dio.dart';

class FeedRepository {
  final dio = Dio(BaseOptions(
    baseUrl: ApiUrl.baseUrl,
  ))
    ..interceptors.add(AuthInterceptor())
    ..interceptors.add(BaseIntercepter());

  Future<Feed?> getFeed() async {
    final response = await dio.get('/search/{id}');

    if (response.statusCode == 200) {
      return Feed.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<List<Feed>?> getAllFeeds() async {
    final response = await dio.get('/search');

    if (response.statusCode == 200) {
      final List feeds = response.data;
      return feeds.map((json) => Feed.fromJson(json)).toList();
    } else {
      return null;
    }
  }

  Future<void> postFeed() async {
    final response = await dio.get('/search');
  }
}
