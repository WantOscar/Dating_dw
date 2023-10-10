// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import '../model/user.dart';

// class AuthController extends GetxController {
//   final user = User(username: '', password: '').obs;
//   final isLoading = false.obs;

//   Future<void> login() async {
//     try {
//       isLoading(true);
//       final response = await http.post(
//         Uri.parse('http://your-spring-service-url/api/users/login'),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: jsonEncode(user.value),
//       );

//       if (response.statusCode == 200) {
//         // 로그인 성공
//       } else {
//         // 로그인 실패
//         // 에러 메시지 처리
//       }
//     } finally {
//       isLoading(false);
//     }
//   }
// }