import 'package:dating/Widget/icon_header.dart';
import 'package:dating/Widget/profile/warning_window.dart';
import 'package:dating/widget/common_header.dart';
import 'package:dating/widget/profile_edit/my_photos.dart';
import 'package:dating/widget/profile/personal_information.dart';
import 'package:dating/widget/profile/personality.dart';
import 'package:dating/widget/profile/interest.dart';
import 'package:dating/widget/profile/ideal_type.dart';
import 'package:dating/controller/user_controller.dart';
import 'package:dating/screen/profile/profile_edit_screen.dart';
import 'package:dating/screen/profile/setting_profile.screen.dart';
import 'package:dating/style/constant.dart';
import 'package:dating/style/icon_shape.dart';
import 'package:dating/style/text_styling.dart';
import 'package:dating/utils/status_enum.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class SomeoneProfileScreen extends StatefulWidget {
  const SomeoneProfileScreen({super.key});

  @override
  State<SomeoneProfileScreen> createState() => _SomeoneProfileScreenState();
}

class _SomeoneProfileScreenState extends State<SomeoneProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IconHeader(
        text: '상대 프로필',
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return WarningWindow(
                    onTap: () {},
                    titleText: '차단',
                    explainText: '상대방을 차단하시겠습니까 ?',
                    btnText: '차단',
                    context: context,
                  );
                },
              );
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body:
          // Obx(
          //   () {
          //     if (UserController.to.status == Status.LOADING) {
          //       return const Center(
          //         child: CircularProgressIndicator.adaptive(),
          //       );
          //     } else if (UserController.to.status == Status.ERROR) {
          //       return const Center(
          //         child: Text("에러가 발생했습니다."),
          //       );
          //     } else {
          //       return _buildBody();
          //     }
          //   },
          // ),
          _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  /// 상대 프로필 사진
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width * 1.1,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          child: Image.network(
                            'https://img3.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202301/19/SpoHankook/20230119052512141eivc.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),

                  /// 상대 이름
                  // ProfilePositionedName(user: UserController.to.myInfo!),
                  Positioned(
                    top: 300,
                    left: 20,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        '아무개',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  /// 상대 나이
                  // ProfilePositionedAge(user: UserController.to.myInfo!),
                  Positioned(
                    top: 360,
                    left: 20,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: IconShape.iconPerson,
                        ),
                        const Text(
                          '22세',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          '167cm',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),

                  /// 상대 위치
                  // ProfilePositionedLocation(user: UserController.to.myInfo!),
                  Positioned(
                    top: 385,
                    left: 20,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: IconShape.iconLocationOn,
                        ),
                        const Text(
                          '서울 강북구',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),

                  /// 채팅하기 버튼
                  Positioned(
                    top: 360,
                    right: 80,
                    child: SizedBox(
                      height: 50,
                      child: Card(
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {
                              chatToast();
                            },
                            child: Text(
                              '채팅하기',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: ThemeColor.fontColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  /// 좋아요 누르기 버튼
                  Positioned(
                    top: 360,
                    right: 20,
                    child: GestureDetector(
                      onTap: () {
                        likeToast();
                      },
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Card(
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: ThemeColor.fontColor,
                                  shape: BoxShape.circle),
                              child: IconShape.iconFavorite,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          /// 상대 인적사항을 알 수 있음(일반대/전문대, 학생/일반, MBTI)
          const PersonalInformation(),

          /// 상대 성격을 보여줌(성격이 어떠한지)
          const Personality(),

          /// 상대 관심사를 보여줌(ex. 게임, 운동, 동물 등등..)
          const Interest(),

          /// 상대방의 이상형이 뭔지 보여줌(예쁜, 잘생긴, 도도한 등등..)
          const IdealType(),
          const SizedBox(height: 50),

          /// 스토리 텍스트
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '스토리',
              style: TextStyle(
                  color: ThemeColor.fontColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),

          /// 상대방이 올린 스토리들을 보여줌
          const Padding(
            padding: EdgeInsets.all(2.0),
            child: Row(
              children: [
                MyPhotos(),
                MyPhotos(),
                MyPhotos(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// 채팅신청이 되었다는 것을 알려주는 알림 함수
void chatToast() {
  Fluttertoast.showToast(
    msg: '채팅을 신청하였습니다',
    backgroundColor: Colors.white,
    gravity: ToastGravity.TOP,
    fontSize: 17,
    textColor: Colors.black,
    toastLength: Toast.LENGTH_SHORT,
    timeInSecForIosWeb: 1,
  );
}

/// 좋아요를 보냈다는 것을 알려주는 알림 함수
void likeToast() {
  Fluttertoast.showToast(
    msg: '좋아요를 보냈습니다.',
    backgroundColor: Colors.white,
    gravity: ToastGravity.TOP,
    fontSize: 17,
    textColor: Colors.black,
    toastLength: Toast.LENGTH_SHORT,
    timeInSecForIosWeb: 1,
  );
}
