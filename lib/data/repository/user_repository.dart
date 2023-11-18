import 'package:dio/dio.dart';

class UserRepository {
  Dio dio = Dio();

  getUserInformation() async {
    // var repo = await dio.get('path');
    await Future.delayed(const Duration(seconds: 2));
    final resp = [
      {
        "name": "한상욱",
        "comment": "댓글",
        "gender": "남성",
        "residence": "서울특별시 강북구 미아동",
        "age": 20,
        "height": 178,
        "image": "Photo",
        "personalInfo": "개인 정보",
        "mbti": "ENFP",
        "personality": "성격",
        "interest": "흥미",
        "likePersonality": "좋아하는 성격"
      },
      {
        "name": "노정운",
        "comment": "댓글",
        "gender": "여성",
        "residence": "거주지",
        "age": 20,
        "height": 178,
      },
      {}
    ];
  }
}
