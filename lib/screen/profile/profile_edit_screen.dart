import 'dart:io';

import 'package:dating/Widget/icon_header.dart';
import 'package:dating/binding/upload_binding.dart';
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

  Future<void> _pickImage() async {
    ImagePicker().pickImage(source: ImageSource.gallery).then(
      (image) {
        if (image != null) {
          setState(() {
            file[imageLength] = image;
            imageLength++;
          });
        }
      },
    );
  }

  /// cupertinopicker(기본 사람 키 값)
  int selectedHeight = 170;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
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
            /// 내 프로필 사진 업로드(6장 제한)
            _uploadMyProfile(),
            const SizedBox(height: 20),

            /// 닉네임 입력(수정 가능)
            _nickNameInput(),
            const SizedBox(height: 7),

            /// 한 줄 소개 입력(수정 가능)
            _introduceInput(width, height),

            /// 본인 성별 나타냄(수정 불가)
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 17.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('성별'),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 17.0),
                    child: Container(
                      width: width * 0.68,
                      height: height * 0.05,
                      decoration: BoxDecoration(
                        color: ThemeColor.inputColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: TextFormField(
                          maxLength: 10,
                          style: const TextStyle(
                            decorationThickness: 0,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: const InputDecoration(
                            counterText: "",
                            hintText: '여자',
                            border: InputBorder.none,
                            isDense: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// 사는 곳 선택하기(수정 가능 or 앱 위치 추적으로 자동으로 설정)
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 17.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('주소'),
                  Container(
                    width: width * 0.68,
                    height: height * 0.05,
                    decoration: BoxDecoration(
                      color: ThemeColor.inputColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: TextFormField(
                        maxLength: 10,
                        style: const TextStyle(
                          decorationThickness: 0,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: const InputDecoration(
                          counterText: "",
                          hintText: '주소 입력',
                          border: InputBorder.none,
                          isDense: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// 본인 나이 나타냄(수정 불가)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 17.0),
                  child: Text('나이'),
                ),
                Container(
                  width: width * 0.68,
                  height: height * 0.05,
                  decoration: BoxDecoration(
                    color: ThemeColor.inputColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: TextFormField(
                      maxLength: 10,
                      style: const TextStyle(
                        decorationThickness: 0,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: const InputDecoration(
                        counterText: "",
                        hintText: '23세',
                        border: InputBorder.none,
                        isDense: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            /// 키 선택하기(수정 가능)
            _selectHeight(context),
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
      ),
      extendBody: true,

      // modification complete
      bottomNavigationBar: BottomApplyBar(
        text: '수정완료',
        onTap: () {
          Get.back();
        },
      ),
    );
  }

  Widget _introduceInput(double width, double height) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 17.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('한줄 소개'),
          Container(
            width: width * 0.68,
            height: height * 0.05,
            decoration: BoxDecoration(
              color: ThemeColor.inputColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: TextFormField(
                maxLength: 10,
                style: const TextStyle(
                  decorationThickness: 0,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                decoration: const InputDecoration(
                  counterText: "",
                  hintText: '소개 입력',
                  border: InputBorder.none,
                  isDense: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _nickNameInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 17.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('닉네임'),
          Text(
            '가재맨',
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }

  Row _selectHeight(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 17.0),
          child: Text('키'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 17.0),
          child: CupertinoButton(
            child: Text('$selectedHeight cm'),
            onPressed: () {
              _showCupertinoPicker(context);
            },
          ),
        ),
      ],
    );
  }

  Widget _uploadMyProfile() {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          _imageIndex.length,
          (index) => Row(
            children: List.generate(_imageIndex[index].length, (jndex) {
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
                        child: (file[_imageIndex[index][jndex]] != null)
                            ? Image.file(
                                File(file[_imageIndex[index][jndex]]!.path),
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

  /// 선택할 키를 보여주는 함수
  void _showCupertinoPicker(BuildContext context) async {
    final List<int> items = List.generate(60, (index) => index);
    int result = items[0];

    await showCupertinoModalPopup(
      context: context,
      builder: (context) => SizedBox(
        height: 200,
        child: CupertinoPicker(
          backgroundColor: Colors.white,
          itemExtent: 50,
          onSelectedItemChanged: (int index) {
            // result = _items[index];
            selectedHeight = items[index];
          },
          children: List.generate(
            60,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  selectedHeight = index + 140;
                });
                Get.back();
              },
              child: Text("${index + 140} cm"),
            ),
          ),
        ),
      ),
    );
  }
}
