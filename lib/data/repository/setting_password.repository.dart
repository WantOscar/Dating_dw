import 'package:dating/utils/api_urls.dart';
import 'package:dating/utils/dio_intercepter.dart';
import 'package:dio/dio.dart';

class SettingPasswordRepository {
  final dio = Dio(BaseOptions(
    baseUrl: ApiUrl.baseUrl,
  ))
    ..interceptors.add(BaseIntercepter());

  /// 사용자 비밀번호 변경 인터페이스
  Future<String> postSettingPassword(Map<String, dynamic> data) async {
    final response = await dio.post(ApiUrl.settingPassword, data: data);

    if (response.statusCode == 200) {
      return response.data["successMessage"];
    } else {
      return response.data["errorMessage"];
    }
  }
}
