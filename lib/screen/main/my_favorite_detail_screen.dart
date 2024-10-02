import 'package:dating/Widget/common/icon_header.dart';
import 'package:dating/utils/enums.dart';
import 'package:dating/widget/main/my_favorite_avatar.dart';
import 'package:dating/controller/main_controller.dart';
import 'package:dating/screen/profile/someone_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavoriteDetailScreen extends GetView<MainController> {
  const MyFavoriteDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IconHeader(
        text: '내가 관심 있는 친구',
        backAction: () => controller.quitFavoriteDetail(),
      ),
      body: Obx(
        () {
          return (controller.myFavoriteMember.isNotEmpty)
              ? SingleChildScrollView(
                  controller: controller.scrollController,
                  child: Column(children: [
                    ...List.generate(
                      controller.myFavoriteMember.length,
                      (index) {
                        final user = controller.myFavoriteMember[index];
                        return Padding(
                          padding: const EdgeInsets.all(12),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => SomeoneProfileScreen(user: user));
                            },
                            child: ListAvatar(user: user),
                          ),
                        );
                      },
                    ),
                    if (controller.isFavoriteLoading == Status.loading)
                      const Padding(
                        padding: EdgeInsets.all(30),
                        child: Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      ),
                    if (controller.isFavoriteLimit)
                      Container(
                        height: 30,
                      ),
                  ]),
                )
              : const Center(
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
    );
  }
}
