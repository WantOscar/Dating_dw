import 'package:dating/utils/toast_message.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class BaseIntercepter extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final errorMessage = err.response?.data["errorMessage"];
    debugPrint("[ERROR OCCURED][${err.requestOptions.baseUrl}][$errorMessage]");
    ToastMessage.showToast(errorMessage);
    switch (err.type) {
      case DioExceptionType.badResponse:
        debugPrint("bad response error, 메소드 url 혹은 파라미터 데이터를 확인하세요.");
        break;
      case DioExceptionType.connectionError:
        debugPrint("connection error, 네트워크 연결을 확인하세요.");
        break;
      case DioExceptionType.connectionTimeout:
        debugPrint("connection time out error, 네트워크 연결을 확인하세요.");
        break;
      case DioExceptionType.cancel:
        debugPrint("cancel error, 네트워크 연결을 확인하세요.");
        break;
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        debugPrint("data transport time out error, 서버 네트워크 설정을 확인하세요.");
        break;
      case DioExceptionType.badCertificate:
        debugPrint("bad certificate error, 인증 정보가 만료되거나 일치하지 않습니다.");
        break;

      case DioExceptionType.unknown:
        debugPrint("unknown error, 알 수 없는 에러가 발생했습니다.");
        break;
    }
    throw Exception(errorMessage);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print(
        "[REQUEST][http method type : ${options.method}][${options.baseUrl}][${options.data}]");
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("[RESPONSE][${response.requestOptions.baseUrl}][${response.data}]");
    handler.next(response);
  }
}
