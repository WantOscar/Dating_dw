import 'package:dating/data/model/token_provider.dart';
import 'package:dating/utils/api_urls.dart';
import 'package:dating/utils/dio_intercepter.dart';
import 'package:dio/dio.dart';

class SettingPasswordRepository {
  final dio = Dio(BaseOptions(
    baseUrl: ApiUrl.baseUrl,
  ))
    ..interceptors.add(BaseIntercepter());

  final tokenProvider = TokenProvider();

  /// 사용자 비밀번호 변경 인터페이스
  Future<String> postSettingPassword(Map<String, dynamic> data) async {
    print("1");
    final accessToken = await tokenProvider.getAccessToken();

    final response = await dio.post(ApiUrl.settingPassword,
        data: data,
        options: Options(headers: {"Authorization": "Bearer $accessToken"}));

    if (response.statusCode == 200) {
      return response.data["successMessage"];
    } else {
      print(response.data);
      return response.data["errorMessage"];
    }
  }
}
