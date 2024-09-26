import 'package:dating/controller/user_controller.dart';
import 'package:dating/data/model/feed.dart';
import 'package:dio/dio.dart';
import 'package:get/state_manager.dart';

class FeedRepositoryImpl extends GetxService implements FeedRepository {
  final Dio dio;

  FeedRepositoryImpl({required this.dio});

  /// 글 전체 조회 API
  /// 서버에 등록된 모든 FEED를 조회한 후
  /// 결과를 FEED 배열로 반환함.
  @override
  Future<List<Feed>> getAllFeeds() async {
    return dio.get('/search/list').then((response) =>
        List<Map<String, dynamic>>.from(response.data)
            .map((json) => Feed.fromJson(json))
            .toList());
  }

  /// 피드 상세 조회 API
  /// ID를 통해서 피드의 상세 내용을 조회한 후
  /// 결과를 FEED로 반환함.
  @override
  Future<Feed> getFeed(int id) async {
    return dio
        .get('/search/list/$id')
        .then((response) => Feed.fromJson(response.data));
  }

  /// 글 등록 API
  /// 로그인한 사용자가 작성한 FEED를 서버에 등록한 후,
  /// 서버에 등록된 FEED결과를 반환함.
  @override
  Future<Feed> postFeed(Map<String, dynamic> data) async {
    return dio
        .post('/search', data: data)
        .then((response) => Feed.fromJson(response.data));
  }

  /// 본인이 작성한 피드 List를 불러오는 API
  @override
  Future<List<Feed>> getMyFeeds(Map<String, dynamic> data) async {
    return dio.get('/search/history', data: data).then((response) =>
        List<Map<String, dynamic>>.from(response.data)
            .map((json) => Feed.fromMyFeed(json, UserController.to.myInfo!))
            .toList());
  }

  /// 본인이 작성한 글을 수정하는 API
  @override
  Future<Feed> patchFeed(Map<String, dynamic> data) async {
    return dio.patch('/search').then((response) =>
        Feed.fromMyFeed(response.data, UserController.to.myInfo!));
  }

  /// 본인이 작성한 글을 삭제하는 API
  @override
  Future<void> deleteFeed(int id) {
    return dio.delete('/search/$id').then((response) async {
      print("Feed $id deleted successfully");
    }).catchError((error) {
      print("Failed to delete feed: $error");
    });
  }
}

abstract class FeedRepository {
  Future<Feed> getFeed(int id);
  Future<List<Feed>> getAllFeeds();
  Future<Feed> postFeed(Map<String, dynamic> data);
  Future<List<Feed>> getMyFeeds(Map<String, dynamic> nickName);
  Future<Feed> patchFeed(Map<String, dynamic> data);
  Future<void> deleteFeed(int id);
}
