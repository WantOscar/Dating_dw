import 'package:dating/utils/api_urls.dart';
import 'package:dating/utils/dio_intercepter.dart';
import 'package:dio/dio.dart';

class BlockOtherUserRespository {
  final Dio dio = Dio(BaseOptions(baseUrl: ApiUrl.baseUrl))
    ..interceptors.add(BaseIntercepter())
    ..interceptors.add(AuthInterceptor());

  Future<void> memberBlock(int id) async {
    final response =
        await dio.post(ApiUrl.memberBlock, queryParameters: {"id": id});
    if (response.statusCode != 200) {
      throw Exception();
    }
  }
}
