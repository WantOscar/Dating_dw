import 'package:dating/widget/common/icon_header.dart';
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
      appBar: const IconHeader(text: '내가 관심 있는 친구'),
      body: Obx(
        () {
          return (controller.myFavoriteMember.isNotEmpty)
              ? SingleChildScrollView(
                  child: Column(
                    children: List.generate(
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
                  ),
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
