import 'package:dating/utils/api_urls.dart';
import 'package:dio/dio.dart';

class HomeRepositoryImpl implements HomeRepository {
  final Dio dio;

  HomeRepositoryImpl({required this.dio});

  /// 홈 화면 정보를 조회하는 API
  /// 랜덤 이성 리스트 20명,
  /// 내가 좋아요를 누른 사용자,
  /// 나에게 좋아요를 누른 사용자를
  /// 각각 USER 배열로 반환함.

  @override
  Future<Map<String, dynamic>> getHomeDatas() async {
    return dio.get(ApiUrl.main).then((response) => response.data);
  }
}

abstract class HomeRepository {
  Future<Map<String, dynamic>> getHomeDatas();
}
