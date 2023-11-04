import 'package:dating/Widget/profile/ideal_type.dart';
import 'package:dating/Widget/profile/interest.dart';
import 'package:dating/Widget/profile/personal_information.dart';
import 'package:dating/Widget/profile/personality.dart';
import 'package:dating/Widget/profile_edit/container_basic.dart';
import 'package:dating/Widget/profile_edit/input_field.dart';
import 'package:dating/style/constant.dart';
import 'package:dating/style/icon_shape.dart';
import 'package:dating/style/text_styling.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: TextStyling.profileEdit2,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: IconShape.iconSettings,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(2.0),
              child: Row(
                children: [
                  ContainerBasic(),
                  ContainerBasic(),
                  ContainerBasic(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: [
                  const ContainerBasic(),
                  const ContainerBasic(),
                  Stack(
                    children: [
                      const ContainerBasic(),
                      Positioned(
                        top: 90,
                        right: 1,
                        child: IconButton(
                          icon: IconShape.iconPhotoCamera,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const InputField(
              text1: '닉네임',
              text2: '압둘라 3세',
              widthPoint: 0.7,
              heightPoint: 0.05,
            ),
            const SizedBox(height: 7),
            const InputField(
              text1: '한줄 소개',
              text2: '소개 입력',
              widthPoint: 0.7,
              heightPoint: 0.05,
            ),
            const SizedBox(height: 7),
            const InputField(
              text1: '성별',
              text2: '여자',
              widthPoint: 0.7,
              heightPoint: 0.05,
            ),
            const SizedBox(height: 7),
            const InputField(
              text1: '주소',
              text2: '주소 입력',
              widthPoint: 0.7,
              heightPoint: 0.05,
            ),
            const SizedBox(height: 7),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: InputField(
                    text1: '나이',
                    text2: '25세',
                    widthPoint: 0.2,
                    heightPoint: 0.05,
                  ),
                ),
                Expanded(
                  child: InputField(
                    text1: '키',
                    text2: '키 입력',
                    widthPoint: 0.2,
                    heightPoint: 0.05,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.002,
              decoration: const BoxDecoration(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            const PersonalInformation(),
            const SizedBox(height: 7),
            const Personality(),
            const SizedBox(height: 7),
            const IdealType(),
            const SizedBox(height: 7),
            const Interest(),
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: fontColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Get.back();
                },
                child: const Center(
                  child: TextStyling.modification,
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
