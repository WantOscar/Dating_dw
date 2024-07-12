import 'package:carousel_slider/carousel_slider.dart';
import 'package:dating/Widget/main/image_avatar.dart';
import 'package:dating/controller/main_controller.dart';
import 'package:dating/controller/user_controller.dart';
import 'package:dating/widget/common/cammit_app_bar.dart';
import 'package:dating/widget/main/today_freinds_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: const CammitAppBar(
          title: '캠밋',
        ),
      ),
      body: Column(
        children: [
          _todayIntroduce(),
          _likeMeDetail(),
          _likeMeList(),
        ],
      ),
    );
  }

  /// 24시간 간격이며 인원 10명 제한으로,
  /// 랜덤 이성을 소개해줌
  Widget _todayIntroduce() {
    return GetX<UserController>(
      builder: (controller) {
        return (controller.users != null)
            ? CarouselSlider.builder(
                itemCount: controller.users!.length,
                itemBuilder: (context, index, realIndex) {
                  final user = controller.users![index];
                  return TodayFriendsProfile(
                    user: user,
                  );
                },
                options: CarouselOptions(
                    enlargeCenterPage: true,
                    aspectRatio: 1,
                    autoPlay: true,
                    viewportFraction: 0.8),
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
      },
    );
  }

  /// 나한테 관심있는 상대 텍스트, 나한테 관심있는 상대방 목록 세부 페이지
  Widget _likeMeDetail() {
    return Padding(
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
    );
  }

  /// 나한테 관심있는 상대방 목록
  Widget _likeMeList() {
    return Obx(
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
                        controller.myFanMembers.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: ImageAvatar(
                            onTap: controller.otherProfile,
                          ),
                        ),
                      ),
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
    );
  }

  //           /// 내가 관심있는 상대 텍스트, 관심있는 상대방 목록 세부 페이지
  //           Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 20),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 const Text(
  //                   '내가 관심 있는 친구',
  //                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //                 ),
  //                 const SizedBox(height: 30),
  //                 IconButton(
  //                   icon: const Icon(Icons.add),
  //                   onPressed: () {
  //                     Get.to(() => const MainFavoriteScreen());
  //                   },
  //                 ),
  //               ],
  //             ),
  //           ),
  //
  //           /// 내가 관심있는 상대방 목록
  //           SizedBox(
  //             height: 200,
  //             child: (controller.users!.sendHeartList.isNotEmpty)
  //                 ? SingleChildScrollView(
  //                     scrollDirection: Axis.horizontal,
  //                     child: Padding(
  //                       padding: const EdgeInsets.symmetric(horizontal: 10),
  //                       child: Row(
  //                         children: List.generate(
  //                             controller.users!.sendHeartList.length, (index) {
  //                           return Padding(
  //                             padding: const EdgeInsets.symmetric(
  //                                 vertical: 10, horizontal: 10),
  //                             child: Avatar(
  //                               onTap: () {
  //                                 Get.to(() => const SomeoneProfileScreen());
  //                               },
  //                             ),
  //                           );
  //                         }),
  //                       ),
  //                       // child: Row(
  //                       //   mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                       //   children: List.generate(
  //                       //     50,
  //                       //     (index) => Padding(
  //                       //       padding: const EdgeInsets.symmetric(
  //                       //           vertical: 10, horizontal: 10),
  //                       //       child: Avatar(
  //                       //         onTap: () {
  //                       //           Get.to(() => const SomeoneProfileScreen());
  //                       //         },
  //                       //       ),
  //                       //     ),
  //                       //   ),
  //                       // ),
  //                     ),
  //                   )
  //                 : const Center(
  //                     child: Text(
  //                       "아직 사용자 없습니다 !",
  //                       style: TextStyle(
  //                           color: Colors.grey,
  //                           fontSize: 15,
  //                           fontWeight: FontWeight.w600),
  //                     ),
  //                   ),
  //           ),
}
