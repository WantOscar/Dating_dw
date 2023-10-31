import 'package:dating/screen/home_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/user.dart';

class AuthController extends GetxController {
  final user = User(email: '', password: '').obs;
  final isLoading = false.obs;

  Future<void> login() async {
    try {
      isLoading(true);
      final response = await http.post(
        Uri.parse(
            'http://ec2-43-202-97-23.ap-northeast-2.compute.amazonaws.com:8080/member/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(user.value),
      );

      if (response.statusCode == 200) {
        Get.to(const HomeScreen());
      } else {
        // 로그인 실패
        // 에러 메시지 처리
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> signUp() async {
    try {
      isLoading(true);
      final response = await http.post(
        Uri.parse(
            'http://ec2-43-202-97-23.ap-northeast-2.compute.amazonaws.com:8080/member/join'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(user.value),
      );

      if (response.statusCode == 200) {
        print("Did it");
      } else {
        throw Exception("failed");
      }
    } catch (e) {
      print("Failed to send post a data : $e");
    }
  }
}
