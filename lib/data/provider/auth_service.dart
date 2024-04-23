import 'package:dating/binding/home_binding.dart';
import 'package:dating/data/model/error_response.dart';
import 'package:dating/data/model/login_response.dart';
import 'package:dating/screen/auth/login_screen.dart';
import 'package:dating/screen/auth/onboard_screen.dart';
import 'package:dating/screen/home_screen.dart';
import 'package:dating/utils/api_urls.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  final Dio dio;
  final FlutterSecureStorage storage;

  AuthService({required this.dio, required this.storage});

  /// 로그인 메소드
  /// 로그인에 성공하면 서버로부터 JWT 토큰을 받고
  /// 로컬 스토리지에 저장됨
  /// 실패할 경우 에러메시지를 반환함.
  Future<void> login(Map<String, dynamic> data) async {
    try {
      final response = await dio.post(ApiUrl.login, data: data);
      if (response.statusCode == 200) {
        final loginResponse = LoginResponse.fromJson(response.data);

        const st = FlutterSecureStorage();
        st.write(
          key: "accessToken",
          value: loginResponse.accessToken,
        );
        st.write(
          key: "refreshToken",
          value: loginResponse.refreshToken,
        );

        Get.off(() => const OnboardScreen(), binding: HomeBinding());
      }
      // } else {
      //   final errorResponse = ErrorResponse.fromJson(response.data);
      //   print(errorResponse.errorMessage);
      // }
    } on DioException catch (error) {
      dioExceptionHander(error);
      return;
    } on Exception {
      Get.snackbar("로그인 실패!", "회원정보를 다시 확인해주세요 !");
    }
  }

  /// 회원가입 메소드
  /// 회원가입에 성공하면
  /// 회원정보를 반환
  /// 회원가입에 실패하면
  /// 에러메시지 반환
  Future<String?> signUp(Map<String, dynamic> json) async {
    try {
      final response = await dio.post(
        ApiUrl.signUp,
        data: json,
      );

      if (response.statusCode == 200) {
        return "회원가입에 성공했습니다!";
      }
    } on DioException catch (error) {
      switch (error.type) {
        case DioExceptionType.badResponse:
          Get.snackbar("중복 회원", "이미 존재하는 회원정보입니다!");
        default:
      }
    } on Exception {
      Get.snackbar("회원가입 실패", "잠시후에 다시 시도해주세요 !");
    }
    return null;
  }

  /// 로그아웃 메소드
  /// 로그아웃을 시도하는 경우
  /// 저장된 토큰을 삭제함.
  /// 삭제 후 로그인화면으로 이동함.
  /// 실패한 경우 에러메시지를 사용자에게 보여줌.
  Future<void> logOut() async {
    try {
      print("토큰 삭제");
      await storage.delete(key: "accessToken");
      await storage.delete(key: "refreshToken");
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      Get.snackbar('로그아웃에 실패하였습니다!', '잠시후 다시 시도해주세요');
    }
  }

  /// 이메일 인증 메소드
  /// 이메일을 통해 인증 번호를 전송해줌
  Future<String?> emailVerify(Map<String, dynamic> json) async {
    try {
      final response = await dio.post(ApiUrl.emailVerify, data: json);
      if (response.statusCode == 200) {
        return response.data["code"];
      } else {
        return null;
      }
    } on DioException catch (error) {
      dioExceptionHander(error);
      return null;
    } on Exception {
      Get.snackbar("에러 !", "잠시후에 다시 시도해주세요!");
    }
    return null;
  }

  void dioExceptionHander(DioException error) {
    switch (error.type) {
      case DioExceptionType.badResponse:
        Get.snackbar("로그인 실패!", "회원정보를 확인해주세요!");
        break;
      case DioExceptionType.connectionTimeout:
        Get.snackbar("네트워크 에러", "런타임 아웃 !");
        break;
      default:
        Get.snackbar("에러", "에러가 발생했습니다!");
        break;
    }
  }
}
