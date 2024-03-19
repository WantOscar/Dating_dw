import 'package:dating/widget/common_header.dart';
import 'package:dating/widget/profile_edit/my_photos.dart';
import 'package:dating/widget/profile/personal_information.dart';
import 'package:dating/widget/profile/personality.dart';
import 'package:dating/widget/profile/interest.dart';
import 'package:dating/widget/profile/ideal_type.dart';
import 'package:dating/controller/user_controller.dart';
import 'package:dating/screen/profile/profile_edit_screen.dart';
import 'package:dating/screen/profile/setting_profile.dart';
import 'package:dating/style/constant.dart';
import 'package:dating/style/icon_shape.dart';
import 'package:dating/style/text_styling.dart';
import 'package:dating/utils/status_enum.dart';
import 'package:flutter/material.dart';
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
        appBar: CommonHeader(
          text: '프로필',
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {
                  Get.to(() => const SettingProfile());
                },
                icon: IconShape.iconSettings,
              ),
            ),
          ],
        ),
        body: Obx(() {
          if (UserController.to.status == Status.LOADING) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (UserController.to.status == Status.ERROR) {
            return const Center(
              child: Text("에러가 발생했습니다."),
            );
          } else {
            return _buildBody();
          }
        }));
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
                  // 상대 프로필 사진
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

                  // 상대 이름
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

                  // 상대 나이
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

                  // 상대 위치
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

                  // 프로필 편집 버튼
                  Positioned(
                    top: 360,
                    right: 20,
                    // child: ProfileEditButton(),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: fontColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfileEditScreen(),
                          ),
                        );
                      },
                      child: TextStyling.profileEdit,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // 상대 정보
          const PersonalInformation(),

          // 상대 성격
          const Personality(),

          // 상대 관심사
          const Interest(),

          // 상대 이상형
          const IdealType(),
          const SizedBox(height: 50),

          // 상대 스토리
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              '스토리',
              style: TextStyle(
                  color: fontColor, fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),

          // 상대 스토리 사진
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
