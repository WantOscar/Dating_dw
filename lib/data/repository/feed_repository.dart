import 'package:dating/data/model/feed.dart';
import 'package:dio/dio.dart';
import 'package:get/state_manager.dart';

class FeedRepositoryImpl extends GetxService implements FeedRepository {
  final Dio dio;

  FeedRepositoryImpl({required this.dio});

  /// 피드 상세 조회 API
  /// ID를 통해서 피드의 상세 내용을 조회한 후
  /// 결과를 FEED로 반환함.
  Future<Feed> getFeed(int id) async {
    return dio
        .get('/search/$id')
        .then((response) => Feed.fromJson(response.data));
  }

  /// 글 전체 조회 API
  /// 서버에 등록된 모든 FEED를 조회한 후
  /// 결과를 FEED 배열로 반환함.
  Future<List<Feed>> getAllFeeds() async {
    return dio.get('/search').then((response) =>
        List<Map<String, dynamic>>.from(response.data)
            .map((json) => Feed.fromJson(json))
            .toList());
  }

  /// 글 등록 API
  /// 로그인한 사용자가 작성한 FEED를 서버에 등록한 후,
  /// 서버에 등록된 FEED결과를 반환함.
  Future<Feed> postFeed(Map<String, dynamic> data) async {
    return dio
        .post('/search', data: data)
        .then((response) => Feed.fromJson(response.data));
  }
}

abstract class FeedRepository {}
