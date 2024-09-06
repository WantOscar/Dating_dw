import 'package:dating/utils/api_urls.dart';
import 'package:dating/utils/dio_intercepter.dart';
import 'package:dio/dio.dart';

class HumanUserRepository implements HumanUserRepositoryImpl {
  final Dio dio = Dio(BaseOptions(baseUrl: ApiUrl.baseUrl))
    ..interceptors.add(BaseIntercepter())
    ..interceptors.add(AuthInterceptor());

  @override
  Future<void> memberHumanUser() {
    throw UnimplementedError();
  }
}

abstract class HumanUserRepositoryImpl {
  Future<void> memberHumanUser();
}
