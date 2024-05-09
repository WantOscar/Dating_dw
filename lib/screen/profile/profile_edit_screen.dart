import 'dart:io';

import 'package:dating/Widget/common/icon_header.dart';
import 'package:dating/Widget/profile/hobby_container.dart';
import 'package:dating/controller/profile_edit_controller.dart';
import 'package:dating/controller/profile_image_controller.dart';
import 'package:dating/screen/profile/profile_thumnail_manage_screen.dart';
import 'package:dating/screen/profile/upload_screen.dart';
import 'package:dating/style/constant.dart';
import 'package:dating/style/icon_shape.dart';
import 'package:dating/widget/bottom_apply_bar.dart';
import 'package:dating/widget/profile/ideal_type.dart';
import 'package:dating/widget/profile/interest.dart';
import 'package:dating/widget/profile/personal_information.dart';
import 'package:dating/widget/profile/personality.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEditScreen extends GetView<ProfileEditController> {
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: IconHeader(
          text: '프로필 수정',
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => const ProfileThumnailManageScreen());
                },
                child: IconShape.iconMore,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _uploadMyProfile(),
              const SizedBox(height: 30),
              _nickNameInput(),
              _introduceInput(),
              _showGender(),
              _address(),
              _age(),
              _selectHeight(context),

              /// 나누는 선
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),

              /// 내 인적사항
              const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
                    child: Text('인적사항'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.start,
                      spacing: 5,
                      runSpacing: 5,
                      children: [
                        HobbyContainer(
                          text: '일반대',
                        ),
                        HobbyContainer(
                          text: '학생',
                        ),
                        HobbyContainer(
                          text: 'ESTP',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 7),

              /// 내 성격
              const Personality(),
              const SizedBox(height: 7),

              /// 내 이상형
              const IdealType(),
              const SizedBox(height: 7),

              /// 내 관심사
              const Interest(),
              const SizedBox(height: 100),
            ],
          ),
        ),
        extendBody: true,

        // modification complete
        bottomNavigationBar: BottomApplyBar(
          text: '수정완료',
          onTap: () {
            Get.back();
          },
        ),
      ),
    );
  }

  /// 프로필 사진을 최소 3장 ~ 최대 6장 선택하여 적용시킴(수정 가능)
  Widget _uploadMyProfile() {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          controller.imageIndex.length,
          (index) => Row(
            children:
                List.generate(controller.imageIndex[index].length, (jndex) {
              return Expanded(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => const UploadScreen(),
                            binding: BindingsBuilder(() {
                          Get.put(ProfileImageController());
                        }));
                      },
                      child: Container(
                        color: Colors.grey,
                        child: (controller.files[controller.imageIndex[index]
                                    [jndex]] !=
                                null)
                            ? Image.file(
                                controller.files[controller.imageIndex[index]
                                    [jndex]]!,
                                fit: BoxFit.cover,
                              )
                            : IconShape.iconNoImage,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  /// 회원정보에서 입력한 닉네임을 보여줌(수정 불가)
  Widget _nickNameInput() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 17.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '닉네임',
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
          SizedBox(
            width: 280,
            child: Text(
              '가재맨',
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  /// 한 줄 소개를 수정하여 프로필에 적용시킴(수정 가능)
  /// 최대 30자 적을 수 있음.
  Widget _introduceInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 17.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            '한줄 소개',
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
          Container(
            height: 40,
            width: 280,
            decoration: BoxDecoration(
              color: ThemeColor.inputColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Center(
                child: TextFormField(
                  maxLength: 30,
                  style: const TextStyle(
                    decorationThickness: 0,
                    fontSize: 14,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: const InputDecoration(
                    counterText: "",
                    hintText: '소개 입력 (최대 30자)',
                    border: InputBorder.none,
                    isDense: true,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 회원정보에서 선택한 성별을 보여줌(수정 불가)
  Widget _showGender() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 17.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '성별',
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
          SizedBox(
            width: 280,
            child: Text(
              '여자',
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  /// 주소를 수정하여 프로필에 적용시킴(수정 가능)
  Widget _address() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 17.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            '주소',
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
          GestureDetector(
            onTap: controller.searchAddress,
            child: Container(
              height: 40,
              width: 280,
              decoration: BoxDecoration(
                color: ThemeColor.inputColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '주소 검색',
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    Icon(Icons.search),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 회원정보에서 입력한 나이를 보여줌(수정 불가)
  Widget _age() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 17.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '나이',
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
          SizedBox(
            width: 280,
            child: Text(
              '22세',
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  /// 키를 수정하여 프로필에 적용시킴(수정 가능)
  Widget _selectHeight(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 17.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            '키',
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
          SizedBox(
            width: 280,
            child: CupertinoButton(
              minSize: 0.0,
              padding: const EdgeInsets.all(0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '170 cm',
                    style: TextStyle(fontSize: 14, color: ThemeColor.fontColor),
                  ),
                ],
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
