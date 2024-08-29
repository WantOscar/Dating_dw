import 'package:dating/utils/api_urls.dart';
import 'package:dating/utils/dio_intercepter.dart';
import 'package:dio/dio.dart';

class MemberBlockRespository {
  final Dio dio = Dio(BaseOptions(baseUrl: ApiUrl.baseUrl))
    ..interceptors.add(BaseIntercepter())
    ..interceptors.add(AuthInterceptor());

  Future<void> postMemberBlock(int id) async {
    return dio.post("/member/block/$id").then((response) => response.data);
  }

  Future<void> postMemberNonBlock(int id) async {
    return dio.post("/member/nonblock/$id").then((response) => response.data);
  }

  Future<void> getMemberBlockList(Map<String, dynamic> data) async {
    return dio.get("/member/block").then((response) => response.data);
  }
}
