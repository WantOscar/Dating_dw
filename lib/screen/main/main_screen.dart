import 'package:carousel_slider/carousel_slider.dart';
import 'package:dating/Widget/main/avatar.dart';
import 'package:dating/controller/main_controller.dart';
import 'package:dating/screen/profile/someone_profile_screen.dart';
import 'package:dating/widget/common/cammit_app_bar.dart';
import 'package:dating/widget/main/today_freinds_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: PreferredSize(
          preferredSize: AppBar().preferredSize,
          child: const CammitAppBar(
            title: '캠밋',
          ),
        ),
        body: (controller.isLoading)
            ? _loading()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    _todayIntroduce(),
                    _myFavoriteList(),
                    _myFanList(),
                  ],
                ),
              ),
      ),
    );
  }

  /// 24시간 간격이며 인원 10명 제한으로,
  /// 랜덤 이성을 소개해줌
  Widget _todayIntroduce() {
    return (controller.recommendMembers.isNotEmpty)
        ? CarouselSlider.builder(
            itemCount: controller.recommendMembers.length,
            itemBuilder: (context, index, realIndex) {
              final user = controller.recommendMembers[index];
              return GestureDetector(
                onTap: () {
                  Get.to(() => SomeoneProfileScreen(user: user));
                },
                child: TodayFriendsProfile(
                  user: user,
                ),
              );
            },
            options: CarouselOptions(
              enlargeCenterPage: true,
              aspectRatio: 1,
              autoPlay: true,
              viewportFraction: 0.8,
              enableInfiniteScroll: false,
              autoPlayInterval: const Duration(seconds: 5),
              pauseAutoPlayOnTouch: true,
            ),
          )
        : const SizedBox(
            height: 300,
            child: Center(
              child: Text(
                "아직 사용자 없습니다 !",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
            ),
          );
  }

  /// 내가 좋아요를 보낸 상대방 목록(상대 대표 이미지를 보여줌)
  Widget _myFavoriteList() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '내가 관심 있는 친구',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: controller.myFavoriteDetailList,
              ),
            ],
          ),
        ),
        Obx(
          () {
            return (controller.myFavoriteMember.isNotEmpty)
                ? SizedBox(
                    height: 200,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List.generate(
                              controller.myFavoriteMember.length, (index) {
                            final user = controller.myFavoriteMember[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Avatar(
                                user: user,
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(
                    height: 200,
                    child: Text(
                      '내가 관심있는 사람이 아직 없습니다.',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
          },
        ),
      ],
    );
  }

  /// 나한테 좋아요를 보낸 상대방 목록(상대 대표 이미지를 보여줌)
  Widget _myFanList() => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '나한테 관심 있는 친구',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: controller.myFanDetailList,
                ),
              ],
            ),
          ),
          Obx(
            () {
              return (controller.myFanMembers.isNotEmpty)
                  ? SizedBox(
                      height: 200,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: List.generate(
                                controller.myFanMembers.length, (index) {
                              final user = controller.myFanMembers[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: Avatar(
                                  user: user,
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(
                      height: 200,
                      child: Text(
                        '나에게 관심있는 사람이 아직 없습니다.',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
            },
          ),
        ],
      );

  /// 새로고침
  Widget _loading() => const Center(
        child: CircularProgressIndicator.adaptive(),
      );
}
