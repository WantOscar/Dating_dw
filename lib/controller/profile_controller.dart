import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileController extends GetxController {
  final Rx<Map<String, dynamic>> _user = Rx<Map<String, dynamic>>({});
  Map<String, dynamic> get user => _user.value;

  final Rx<String> _uid = "".obs;

  updateUserId(String uid) {
    _uid.value = uid;
    getUserData();
  }

  getUserData() async {
    final response = await http.get(
      Uri.parse(
          'http://ec2-43-202-97-23.ap-northeast-2.compute.amazonaws.com:8080/member/profile/'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> userData = json.decode(response.body);
      _user.value = userData;
    } else {
      print('데이터 가져오기 실패 ${response.statusCode}');
    }
    final userData = getUserData().data('users') as dynamic;
    String name = userData['name'];
    String comment = userData['comment'];
    String gender = userData['gender'];
    String residence = userData['residence'];
    int age = userData['age'];
    int height = userData['height'];
    String image = userData['image'];
    String personalInfo = userData['personalInfo'];
    String mbti = userData['mbti'];
    String personality = userData['personality'];
    String interest = userData['interest'];
    String likePersonality = userData['likePersonality'];
  }
}
