import 'package:dating/utils/api_urls.dart';
import 'package:dating/utils/dio_intercepter.dart';
import 'package:dio/dio.dart';

class SettingPasswordRepository {
  final dio = Dio(BaseOptions(
    baseUrl: ApiUrl.baseUrl,
  ))
    ..interceptors.add(AuthInterceptor())
    ..interceptors.add(BaseIntercepter());
}
