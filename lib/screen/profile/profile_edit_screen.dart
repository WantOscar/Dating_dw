import 'package:dating/widget/common/cammit_app_bar.dart';
import 'package:dating/widget/profile/profile_image.dart';
import 'package:dating/controller/profile_edit_controller.dart';
import 'package:dating/controller/profile_image_controller.dart';
import 'package:dating/screen/profile/profile_thumnail_manage_screen.dart';
import 'package:dating/screen/profile/upload_screen.dart';
import 'package:dating/style/constant.dart';
import 'package:dating/style/icon_shape.dart';
import 'package:dating/widget/common/bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileEditScreen extends GetView<ProfileEditController> {
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: PreferredSize(
          preferredSize: AppBar().preferredSize,
          child: CammitAppBar(
            showCloseButton: true,
            backAction: controller.back,
            title: '프로필 수정',
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
              _selectHeight(),

              /// 나누는 선
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),

              /// 내 인적사항
              // const Column(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Padding(
              //       padding:
              //           EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
              //       child: Text('인적사항'),
              //     ),
              //     Padding(
              //       padding: EdgeInsets.symmetric(horizontal: 20.0),
              //       child: Wrap(
              //         direction: Axis.horizontal,
              //         alignment: WrapAlignment.start,
              //         spacing: 5,
              //         runSpacing: 5,
              //         children: [
              //           HobbyContainer(
              //             text: '일반대',
              //           ),
              //           HobbyContainer(
              //             text: '학생',
              //           ),
              //           HobbyContainer(
              //             text: 'ESTP',
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 7),

              /// 내 성격
              // const Personality(),
              // const SizedBox(height: 7),

              /// 내 이상형
              // const IdealType(),
              // const SizedBox(height: 7),

              /// 내 관심사
              // const Interest(),
              // const SizedBox(height: 100),
              _completeButton(),
            ],
          ),
        ),
        extendBody: true,
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
          2,
          (index) => Row(
            children: List.generate(
              3,
              (jndex) => Expanded(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: (controller
                                .images[controller.imageIndex[index][jndex]] !=
                            null)
                        ? ProfileImage(
                            src: controller
                                .images[controller.imageIndex[index][jndex]])
                        : GestureDetector(
                            onTap: () {
                              Get.to(() => const UploadScreen(),
                                  binding: BindingsBuilder(() {
                                Get.put(ProfileImageController());
                              }));
                            },
                            child: Container(
                              color: Colors.grey,
                              child: IconShape.iconNoImage,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 회원정보에서 입력한 닉네임을 보여줌(수정 불가)
  Widget _nickNameInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 17.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            '닉네임',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          SizedBox(
            width: 280,
            child: Text(
              controller.user!.nickName!,
              style: const TextStyle(
                fontSize: 14,
              ),
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
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          Container(
            height: 40,
            width: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Center(
                child: TextFormField(
                  controller: controller.descriptionController,
                  onChanged: controller.changeDescription,
                  maxLength: 30,
                  style: const TextStyle(
                    decorationThickness: 0,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    counterText: "",
                    hintText: controller.user!.description ?? "한줄 소개를 입력해주세요.",
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 17.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            '성별',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(
            width: 280,
            child: Text(
              controller.user!.gender! == "woman" ? "여자" : "남자",
              style: const TextStyle(fontSize: 14),
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
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          GestureDetector(
            onTap: controller.searchMyAddress,
            child: Container(
              height: 40,
              width: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        (controller.address.isEmpty)
                            ? controller.user!.address!
                            : controller.address,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          color: ThemeColor.textfieldText,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const Icon(Icons.search),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 17.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "나이",
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(
            width: 280,
            child: Text(
              "${controller.user!.age!}세",
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 키를 수정하여 프로필에 적용시킴(수정 가능)
  Widget _selectHeight() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 17.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            '키',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          SizedBox(
            width: 280,
            child: GestureDetector(
              onTap: controller.updateUserHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '${controller.user!.height!} cm',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _completeButton() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: BottomButton(
          onTap: controller.updateUserInfo,
          child: const Text(
            "수정 완료",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      );
}
