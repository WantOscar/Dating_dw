import 'package:dating/data/model/token_provider.dart';
import 'package:dating/data/service/auth_service.dart';
import 'package:dating/screen/auth/login_screen.dart';
import 'package:dating/utils/api_urls.dart';
import 'package:dating/utils/toast_message.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as g;

class BaseIntercepter extends Interceptor with ToastMessage {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final errorMessage = err.response?.data;
    debugPrint("[ERROR OCCURED][${err.type}][${err.requestOptions.uri}]");
    debugPrint("[ERROR OCCURED][$errorMessage]");
    // showToast("${errorMessage["errorMessage"]}");
    switch (err.type) {
      case DioExceptionType.badResponse:
        debugPrint("올바르지 못한 요청입니다. url, 파라미터가 정확한지 확인하세요.");
        break;
      case DioExceptionType.cancel:
        showToast("요청이 취소되었습니다.");
        debugPrint("요청이 취소되었습니다.");
        break;
      case DioExceptionType.connectionError:
        showToast("네트워크 연결이 원할하지 않습니다.");
        debugPrint("네트워크 연결이 원할하지 않습니다.");
        break;
      default:
        showToast("알 수 없는 에러가 발생했습니다.");
        debugPrint("알 수 없는 에러가 발생했습니다.");
        break;
    }
    throw Exception(errorMessage);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint("[REQUEST][${options.method}][${options.uri}]");
    debugPrint("[REQUEST][${options.data}]");
    debugPrint("[REQUEST][${options.headers}]");
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        "[RESPONSE][${response.statusCode}][${response.requestOptions.uri}]");
    debugPrint("[RESPONSE][${response.data}]");
    handler.next(response);
  }
}

class AuthInterceptor extends Interceptor {
  final tokenProvider = TokenProvider();
  final service = AuthService();
  final dio = Dio(
    BaseOptions(baseUrl: ApiUrl.baseUrl),
  );

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await tokenProvider.getAccessToken();
    options.headers["Authorization"] = "Bearer $accessToken";
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 403) {
      debugPrint("[ERROR OCCURED][Access Token 토큰 만료]");

      // 리프레시 토큰 가져오기
      final refreshToken = await tokenProvider.getRefreshToken();
      print(refreshToken);
      // 액세스 토큰 갱신
      try {
        /// 성공하면 새롭게 요청을 수행함
        /// 실패하면 로그아웃됨
        ///
        final newAccessToken = await issueNewAccessToken(refreshToken);
        err.requestOptions.headers["Authorization"] = newAccessToken;
        handler.resolve(await dio.fetch(err.requestOptions));
      } on DioException {
        tokenProvider.deleteTokenInfo();
        g.Get.off(() => const LoginScreen());
      }
    }
  }

  /// 사용자 로그인 정보 무결성 검증 및 새 엑세스 토큰 발급 메소드
  /// 사용자의 리프레시 토큰이 만료된 경우
  /// 강제로 로그아웃됨.
  /// 리프레시 토큰이 유효한 경우 새 엑세스 토큰을 발급 후 저장.
  Future<String?> issueNewAccessToken(String refreshToken) async {
    final response = await dio.post("/refresh",
        options: Options(headers: {"refreshToken": "Bearer $refreshToken"}));
    if (response.statusCode == 200) {
      await tokenProvider.saveAccessToken(response.data["accessToken"]);
      return response.data["accessToken"];
    } else {
      return null;
    }
  }
}

class MemberIntercetor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint(err.response?.statusCode.toString());
    if (err.response?.statusCode == 400) {
      handler.reject(err);
    } else {
      handler.next(err);
    }
  }
}
