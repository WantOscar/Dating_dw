import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dating/Widget/profile/hobby_container.dart';
import 'package:dating/controller/profile_edit_controller.dart';
import 'package:dating/controller/setting_controller.dart';
import 'package:dating/controller/user_controller.dart';
import 'package:dating/data/service/user_fetch.dart';
import 'package:dating/screen/profile/profile_edit_screen.dart';
import 'package:dating/screen/profile/setting_profile.screen.dart';
import 'package:dating/style/constant.dart';
import 'package:dating/style/icon_shape.dart';
import 'package:dating/widget/common/cammit_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProfileScreen extends GetView<UserController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: PreferredSize(
          preferredSize: AppBar().preferredSize,
          child: CammitAppBar(
            title: "프로필",
            actions: [
              GestureDetector(
                  onTap: () {
                    Get.to(() => const SettingAccountScreen(),
                        binding: BindingsBuilder(() {
                      Get.put(SettingController());
                    }));
                  },
                  child: Icon(
                    Icons.settings,
                    color: ThemeColor.fontColor,
                    size: 30,
                  ))
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 70),
          child: CustomScrollView(
            slivers: [
              _profile(),
              _info(),
              _personality(),
              _interesting(),
              _idealType(),
            ],
          ),
        ),
      ),
    );
  }

  /// 사용자의 프로필 이미지를 보여주는 슬라이더 위젯
  Widget _profileImages() {
    return GetX<UserController>(builder: (controller) {
      return (controller.myInfo?.images == [])
          ? CarouselSlider.builder(
              itemCount: 6,
              itemBuilder: (context, index, realIndex) {
                return AspectRatio(
                    aspectRatio: 1.1,
                    child: Container(
                      color: Colors.grey,
                    ));
              },
              options: CarouselOptions(
                enableInfiniteScroll: false,
                aspectRatio: 1,
                viewportFraction: 1,
                onPageChanged: controller.changeImageIndex,
              ),
            )
          : CarouselSlider.builder(
              itemCount: controller.myInfo!.images!.length,
              itemBuilder: (context, index, realIndex) {
                return AspectRatio(
                    aspectRatio: 1.1,
                    child: Container(
                      color: Colors.grey,
                      child: CachedNetworkImage(
                        imageUrl: controller.myInfo!.images![index],
                      ),
                    ));
              },
              options: CarouselOptions(
                enableInfiniteScroll: false,
                aspectRatio: 1,
                viewportFraction: 1,
                onPageChanged: controller.changeImageIndex,
              ),
            );
    });
  }

  Widget _options() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        (controller.myInfo?.images?.length == 0)
            ? Container()
            : AnimatedSmoothIndicator(
                activeIndex: controller.imageIndex,
                count: controller.myInfo!.images!.length,
                effect: ScrollingDotsEffect(
                  dotColor: Colors.grey,
                  activeDotColor: ThemeColor.fontColor,
                  activeDotScale: 1,
                  spacing: 4.0,
                  dotWidth: 10.0,
                  dotHeight: 10.0,
                ),
              ),
      ],
    );
  }

  Widget _profile() => SliverToBoxAdapter(
        child: Stack(
          children: [
            /// 내 프로필 사진들
            _profileImages(),

            /// 이미지 슬라이더
            Positioned(
              right: 10,
              left: 10,
              bottom: 10,
              child: _options(),
            ),

            /// 내 닉네임을 보여줌
            Positioned(
              top: 240,
              left: 20,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  controller.myInfo!.nickName!,
                  style: const TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            /// 내 나이를 보여줌
            Positioned(
              top: 310,
              left: 35,
              child: Row(
                children: [
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: IconShape.iconPerson,
                  // ),
                  IconShape.iconPerson,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "${controller.myInfo!.age!.toString()}세",
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// 내 키를 보여줌
            Positioned(
              top: 330,
              left: 35,
              child: Row(
                children: [
                  const Icon(Icons.height, size: 20, color: Colors.white),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "${controller.myInfo!.height!}cm",
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// 내 위치를 나타냄
            Positioned(
              top: 350,
              left: 35,
              child: Row(
                children: [
                  IconShape.iconLocationOn,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      controller.myInfo!.address!,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),

            /// 프로필 편집 버튼
            Positioned(
              top: 340,
              right: 20,
              // child: ProfileEditButton(),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ThemeColor.fontColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Get.to(() => const ProfileEditScreen(),
                      binding: BindingsBuilder(() {
                    // ProfileImageController();
                    Get.put(ProfileEditController(userService: UserFetch()));
                  }));
                },
                child: const Text(
                  '프로필 편집',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  /// 내 인적사항을 보여줌
  Widget _info() => const SliverToBoxAdapter(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
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
      );

  /// 내 성격을 보여줌
  Widget _personality() => const SliverToBoxAdapter(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
              child: Text('성격'),
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
                    text: '털털한',
                  ),
                  HobbyContainer(
                    text: '기모띠',
                  ),
                  HobbyContainer(
                    text: '자유로운',
                  ),
                  HobbyContainer(
                    text: '유쾌한',
                  ),
                  HobbyContainer(
                    text: '대담한',
                  ),
                  HobbyContainer(
                    text: '보수적인',
                  ),
                  HobbyContainer(
                    text: '재밌는',
                  ),
                  HobbyContainer(
                    text: '호전적인',
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  /// 내 관심사를 보여줌
  Widget _interesting() => const SliverToBoxAdapter(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
              child: Text('관심사'),
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
                    text: '게임',
                  ),
                  HobbyContainer(
                    text: 'IT',
                  ),
                  HobbyContainer(
                    text: '운동',
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  /// 내 이상형을 보여줌
  Widget _idealType() => const SliverToBoxAdapter(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
              child: Text('이상형'),
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
                    text: '예쁜',
                  ),
                  HobbyContainer(
                    text: '귀여운',
                  ),
                  HobbyContainer(
                    text: '섹시한',
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
