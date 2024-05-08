import 'dart:io';

import 'package:dating/Widget/common/property_text_field.dart';
import 'package:dating/controller/init_profile_upload_screen_controller.dart';
import 'package:dating/controller/onboard_controller.dart';
import 'package:dating/screen/profile/init_profile_upload_screen.dart';
import 'package:dating/style/constant.dart';
import 'package:dating/utils/enums.dart';
import 'package:dating/widget/common/bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class OnboardScreen extends GetView<OnboardingController> {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => (controller.isLoading)
          ? _loading()
          : GestureDetector(
              onTap: FocusScope.of(context).unfocus,
              child: Scaffold(
                  appBar: AppBar(
                    title: const Text("프로필 생성"),
                    titleTextStyle: TextStyle(
                        color: ThemeColor.fontColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                    backgroundColor: Colors.white,
                    elevation: 0.0,
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        _thumNails(),
                        _basicProfiles(),
                        _optionalProfiles(),
                        _createProfileButton(),
                      ],
                    ),
                  )),
            ),
    );
  }

  /// 선택한 프로필 이미지를 보여주는 프리뷰 위젯
  /// 하단의 카메라 버튼을 통해서 이미지를 불러올 수 있음.
  Widget _thumNails() {
    List<List<Color>> defaultThumNailBoxColors = [
      [
        const Color(0xffcfa9a9),
        const Color(0xffe7d3d3),
        const Color(0xffffd4d4),
      ],
      [
        const Color(0xffebebeb),
        const Color(0xffffa5a5),
        const Color(0xffb8afaf),
      ]
    ];
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              2,
              (i) => Row(
                    children: List.generate(
                        3,
                        (j) => Obx(() {
                              return Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    /// 이미지 확대 기능 추가 예정.
                                  },
                                  child: AspectRatio(
                                    aspectRatio: 1.0,
                                    child: (controller.selectProfileImage[i]
                                                [j] ==
                                            null)
                                        ? Container(
                                            color: defaultThumNailBoxColors[i]
                                                [j],
                                          )
                                        : Image.file(controller
                                            .selectProfileImage[i][j]!),
                                  ),
                                ),
                              );
                            })),
                  )),
        ),
        Positioned(
          bottom: 10.0,
          right: 10.0,
          child: GestureDetector(
            onTap: () {
              Get.to(() => const InitProfileUploadScreen(),
                  binding: BindingsBuilder(() {
                Get.put(InitProfileUploadScreenController());
              }), transition: Transition.downToUp);
            },
            child: Card(
              elevation: 3.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.photo_camera,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  /// 사용자가 기본 프로필 정보를 입력하는 위젯
  /// 이 위젯은 반드시 정보를 기입해야만,
  /// 프로필 등록을 완료할 수 있음.
  Widget _basicProfiles() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Row(
              children: [
                Text(
                  "기본정보",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff848484)),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: PropertyTextField(
                  controller: controller.nickName,
                  label: "닉네임",
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: controller.setGenderToMan,
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          decoration: BoxDecoration(
                              color: (controller.gender == Gender.man)
                                  ? Colors.blue.withOpacity(0.5)
                                  : const Color(0xffefefef),
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Text(
                            "남성",
                            style: TextStyle(
                                fontSize: 15,
                                color: (controller.gender == Gender.man)
                                    ? Colors.white
                                    : const Color(0xffafafaf)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: controller.setGenderToWoman,
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          decoration: BoxDecoration(
                              color: (controller.gender == Gender.woman)
                                  ? Colors.red.withOpacity(0.5)
                                  : const Color(0xffefefef),
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Text(
                            "여성",
                            style: TextStyle(
                                fontSize: 15,
                                color: (controller.gender == Gender.woman)
                                    ? Colors.white
                                    : const Color(0xffafafaf)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: controller.pickBirthdayYear,
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xffefefef),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Obx(
                              () => Text(
                                (controller.year == 0)
                                    ? "생년"
                                    : controller.year.toString(),
                                style: TextStyle(
                                    color: (controller.year == 0)
                                        ? const Color(0xffafafaf)
                                        : Colors.black87,
                                    fontSize: 15),
                              ),
                            ),
                            const Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: VerticalDivider(),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Color(0xffafafaf),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: controller.pickBirthdayMonth,
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xffefefef),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Obx(
                              () => Text(
                                (controller.month == 0)
                                    ? "월"
                                    : controller.month.toString(),
                                style: TextStyle(
                                    color: (controller.month == 0)
                                        ? const Color(0xffafafaf)
                                        : Colors.black87,
                                    fontSize: 15),
                              ),
                            ),
                            const Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: VerticalDivider(),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Color(0xffafafaf),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: controller.pickBirthdayDay,
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xffefefef),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Obx(
                              () => Text(
                                (controller.day == 0)
                                    ? "일"
                                    : controller.day.toString(),
                                style: TextStyle(
                                    color: (controller.day == 0)
                                        ? const Color(0xffafafaf)
                                        : Colors.black87,
                                    fontSize: 15),
                              ),
                            ),
                            const Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: VerticalDivider(),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Color(0xffafafaf),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                alignment: Alignment.centerLeft,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: const Color(0xffefefef),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          (controller.address == null)
                              ? "주소"
                              : controller.address!.address!,
                          style: const TextStyle(
                            color: Color(0xffafafaf),
                            fontSize: 15,
                          ),
                        ),
                        GestureDetector(
                          onTap: controller.searchMyAddress,
                          child: Icon(
                            (controller.address == null)
                                ? Icons.search
                                : Icons.close,
                            color: const Color(0xffafafaf),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                alignment: Alignment.centerLeft,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: const Color(0xffefefef),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "상세주소",
                    style: TextStyle(
                      color: Color(0xffafafaf),
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  ///사용자가 선택적인 프로필 입력을 할 수 있는 위젯
  Widget _optionalProfiles() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Column(
          children: [
            const Row(
              children: [
                Text(
                  "선택정보",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff848484)),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: PropertyTextField(
                  controller: controller.description,
                  label: "한줄소개",
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xffefefef),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => Text(
                          (controller.height == "")
                              ? "신장"
                              : "${controller.height}cm",
                          style: TextStyle(
                            color: (controller.height == "")
                                ? const Color(0xffafafaf)
                                : Colors.black87,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: controller.pickMyHeight,
                        child: const Row(
                          children: [
                            Text(
                              "선택",
                              style: TextStyle(
                                  color: Color(0xffafafaf),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Color(0xffafafaf),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );

  Widget _createProfileButton() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: BottomButton(
        onTap: controller.goToHome,
        child: Text("프로필 생성",
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600)),
      ));

  Widget _loading() => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: LoadingAnimationWidget.fourRotatingDots(
                color: ThemeColor.fontColor, size: 40),
          ),
        ),
      );
}
