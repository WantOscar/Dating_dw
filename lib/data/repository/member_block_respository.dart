import 'package:dating/data/model/user.dart';
import 'package:dating/utils/api_urls.dart';
import 'package:dating/utils/dio_intercepter.dart';
import 'package:dio/dio.dart';

class MemberBlockRespository {
  final Dio dio = Dio(BaseOptions(baseUrl: ApiUrl.baseUrl))
    ..interceptors.add(AuthInterceptor())
    ..interceptors.add(BaseIntercepter());

  Future<void> postMemberBlock(int id) async {
    return dio.post("/member/block/$id").then((response) => response.data);
  }

  Future<void> postMemberNonBlock(int id) async {
    return dio.post("/member/nonblock/$id").then((response) => response.data);
  }

  Future<List<User>> getMemberBlockList() async {
    return dio.get("/member/block").then((response) =>
        List.from(response.data["blockMemberList"])
            .map((json) => User.fromJson(json))
            .toList());
  }
}
