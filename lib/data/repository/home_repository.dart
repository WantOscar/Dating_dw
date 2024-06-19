import 'package:dating/utils/api_urls.dart';
import 'package:dating/utils/dio_intercepter.dart';
import 'package:dio/dio.dart';

class HomeRepository {
  final Dio dio = Dio(BaseOptions(
    baseUrl: ApiUrl.baseUrl,
  ))
    ..interceptors.add(AuthInterceptor())
    ..interceptors.add(BaseIntercepter());

  Future<Map<String, dynamic>> getHomeDatas() async {
    final response = await dio.get(ApiUrl.main);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception();
    }
  }
}
