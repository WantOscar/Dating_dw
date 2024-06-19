import 'package:dating/data/model/main_response.dart';
import 'package:dating/data/model/user.dart';
import 'package:dating/data/service/user_fetch.dart';

class UserRepository {
  UserFetch service;
  UserRepository({required this.service});

  Future<User?> searchMyInfo() => service.searchMyInfo();

  Future<List<User>> getAllUserData() async {
    await Future.delayed(const Duration(seconds: 2));

    final users = [
      {
        "nickName": "karina",
        "description": "",
        "birthDay": "1999 - 01 - 01",
        "address": "서울 노원구 공릉로",
        "gender": "man",
        "age": 26,
        "height": 164,
        "images": [
          "https://nc-bucket123.s3.ap-northeast-2.amazonaws.com/cammet/profile/qlsod9570@naver.com/8abc21d0-69e8-1fe3-9f1e-b5b1a6dab524.jpeg",
          "https://nc-bucket123.s3.ap-northeast-2.amazonaws.com/cammet/profile/qlsod9570@naver.com/8af0c660-69e8-1fe3-9f1e-b5b1a6dab524.jpeg",
          "https://nc-bucket123.s3.ap-northeast-2.amazonaws.com/cammet/profile/qlsod9570@naver.com/8af978f0-69e8-1fe3-9f1e-b5b1a6dab524.jpeg"
        ],
        "image":
            "https://nc-bucket123.s3.ap-northeast-2.amazonaws.com/cammet/profile/qlsod9570@naver.com/8abc21d0-69e8-1fe3-9f1e-b5b1a6dab524.jpeg",
        "personalInfo": null,
        "personality": null,
        "interest": null,
        "likePersonality": null
      },
    ];
    return users.map((user) => User.fromJson(user)).toList();
  }
}
