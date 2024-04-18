import 'dart:io';
import 'package:dating/Widget/icon_header.dart';
import 'package:dating/controller/profile_image_controller.dart';
import 'package:dating/screen/profile/profile_thumnail_manage_screen.dart';
import 'package:dating/screen/profile/upload_screen.dart';
import 'package:dating/widget/bottom_apply_bar.dart';
import 'package:dating/widget/profile/ideal_type.dart';
import 'package:dating/widget/profile/interest.dart';
import 'package:dating/widget/profile/personal_information.dart';
import 'package:dating/widget/profile/personality.dart';
import 'package:dating/widget/profile_edit/input_field.dart';
import 'package:dating/style/icon_shape.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  List<XFile?> file = [
    null,
    null,
    null,
    null,
    null,
    null,
  ];
  var imageLength = 0;

  final List<List<int>> _imageIndex = [
    [0, 1, 2],
    [3, 4, 5],
  ];

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: IconHeader(
        text: '프로필 수정',
        actions: [
          // IconButton(
          //   onPressed: _pickImage,
          //   icon: IconShape.iconPhotoCamera,
          // ),
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
      body: _buildBody(),

      // modification complete
      bottomNavigationBar: BottomApplyBar(
        text: '수정완료',
        onTap: () {
          Get.back();
        },
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 내 프로필 사진 업로드(6장 제한)
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => const UploadScreen(),
                        binding: BindingsBuilder(() {
                      Get.put(
                        ProfileImageController(),
                      );
                    }), transition: Transition.downToUp);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _imageIndex.length,
                      (index) => Row(
                        children:
                            List.generate(_imageIndex[index].length, (jndex) {
                          return Expanded(
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Container(
                                  color: Colors.grey,
                                  child: (file[_imageIndex[index][jndex]] !=
                                          null)
                                      ? Image.file(
                                          File(file[_imageIndex[index][jndex]]!
                                              .path),
                                          fit: BoxFit.cover,
                                        )
                                      : IconShape.iconNoImage,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              /// 닉네임 입력
              const InputField(
                text1: '닉네임',
                text2: '압둘라 3세',
                widthPoint: 0.68,
                heightPoint: 0.05,
              ),
              const SizedBox(height: 7),

              /// 한 줄 소개
              const InputField(
                text1: '한줄 소개',
                text2: '소개 입력',
                widthPoint: 0.68,
                heightPoint: 0.05,
              ),
              const SizedBox(height: 7),

              /// 성별 선택
              const InputField(
                text1: '성별',
                text2: '여자',
                widthPoint: 0.68,
                heightPoint: 0.05,
              ),
              const SizedBox(height: 7),

              /// 사는 곳 입력
              const InputField(
                text1: '주소',
                text2: '주소 입력',
                widthPoint: 0.68,
                heightPoint: 0.05,
              ),
              const SizedBox(height: 7),

              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// 나이 입력
                  Expanded(
                    child: InputField(
                      text1: '나이',
                      text2: '25세',
                      widthPoint: 0.18,
                      heightPoint: 0.05,
                    ),
                  ),

                  /// 키 입력
                  Expanded(
                    child: InputField(
                      text1: '키',
                      text2: '키 입력',
                      widthPoint: 0.18,
                      heightPoint: 0.05,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              /// 나누는 선
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),

              /// 내 인적사항
              const PersonalInformation(),
              const SizedBox(height: 7),

              /// 내 성격
              const Personality(),
              const SizedBox(height: 7),

              /// 내 이상형
              const IdealType(),
              const SizedBox(height: 7),

              /// 내 관심사
              const Interest(),
              const SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }
}
