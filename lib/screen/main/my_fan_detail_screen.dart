import 'package:dating/Widget/common/icon_header.dart';
import 'package:dating/Widget/main/my_favorite_avatar.dart';
import 'package:dating/controller/main_controller.dart';
import 'package:dating/screen/profile/someone_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFanDetailScreen extends GetView<MainController> {
  const MyFanDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const IconHeader(text: '내가 관심 있는 친구'),
      body: Obx(
        () {
          return (controller.myFanMembers.isNotEmpty)
              ? SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                      controller.myFanMembers.length,
                      (index) {
                        final user = controller.myFanMembers[index];
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
    );
  }
}
