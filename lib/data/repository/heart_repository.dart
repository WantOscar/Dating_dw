import 'package:dating/utils/api_urls.dart';
import 'package:dating/utils/dio_intercepter.dart';
import 'package:dio/dio.dart';

class HeartRepository implements HeartRepositoryImpl {
  final Dio dio = Dio(BaseOptions(
    baseUrl: ApiUrl.baseUrl,
  ))
    ..interceptors.add(AuthInterceptor())
    ..interceptors.add(BaseIntercepter());

  @override
  Future<void> heartAdd(int id) async {
    final response =
        await dio.post(ApiUrl.heartAdd, queryParameters: {"id": id});
    if (response.statusCode != 200) {
      throw Exception();
    }
  }
}

abstract class HeartRepositoryImpl {
  Future<void> heartAdd(int id);
}
