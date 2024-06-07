import 'package:dating/data/model/token_provider.dart';
import 'package:dating/data/service/auth_service.dart';
import 'package:dating/utils/toast_message.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class BaseIntercepter extends Interceptor with ToastMessage {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final errorMessage = err.response?.data;
    debugPrint("[ERROR OCCURED][${err.type}][${err.requestOptions.uri}]");
    debugPrint("[ERROR OCCURED][$errorMessage]");
    showToast("${errorMessage["errorMessage"]}");
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
  final dio = Dio();

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

      final refreshToken = await tokenProvider.getRefreshToken();
      final authorization = await service.refreshToken(refreshToken);
      if (authorization) {
        err.requestOptions.headers["accessToken"] =
            await tokenProvider.getAccessToken();
        handler.resolve(await dio.fetch(err.requestOptions));
      }
    } else {
      handler.next(err);
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
