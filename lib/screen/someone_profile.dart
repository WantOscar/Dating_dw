import 'package:dating/widget/common_header.dart';
import 'package:dating/widget/profile_edit/my_photos.dart';
import 'package:dating/widget/profile/personal_information.dart';
import 'package:dating/widget/profile/personality.dart';
import 'package:dating/widget/profile/interest.dart';
import 'package:dating/widget/profile/ideal_type.dart';
import 'package:dating/widget/profile/profile_positioned_age.dart';
import 'package:dating/widget/profile/profile_edit_button.dart';
import 'package:dating/widget/profile/profile_positioned_location.dart';
import 'package:dating/widget/profile/profile_positioned_name.dart';
import 'package:dating/widget/profile/profile_picture.dart';
import 'package:dating/controller/user_controller.dart';
import 'package:dating/screen/profile/setting_profile.dart';
import 'package:dating/style/constant.dart';
import 'package:dating/style/icon_shape.dart';
import 'package:dating/utils/status_enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SomeOneProfileScreen extends GetView<UserController> {
  const SomeOneProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonHeader(
        text: '누군가의 프로필',
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
      body: Obx(() => (controller.status == Status.LOADING)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _buildBody()),
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
                  // 누군가의 프로필 사진
                  const ProfilePicture(),

                  // 누군가의 이름
                  ProfilePositionedName(user: controller.myInfo!),

                  // 누군가의 나이
                  ProfilePositionedAge(
                    user: controller.myInfo!,
                  ),

                  // 누군가의 위치
                  ProfilePositionedLocation(
                    user: controller.myInfo!,
                  ),

                  // 프로필 편집 버튼
                  const Positioned(
                    top: 360,
                    right: 20,
                    child: ProfileEditButton(),
                  ),
                ],
              ),
            ],
          ),
          // 누군가의 정보
          const PersonalInformation(),

          // 누군가의 성격
          const Personality(),

          // 누군가의 관심사
          const Interest(),

          // 누군가의 이상형
          const IdealType(),
          const SizedBox(height: 50),

          // 누군가의 스토리
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              '스토리',
              style: TextStyle(
                  color: ThemeColor.fontColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),

          // 누군가의 스토리 사진
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
