import 'package:dating/widget/common/cammit_app_bar.dart';
import 'package:dating/widget/main/my_favorite_avatar.dart';
import 'package:dating/controller/main_controller.dart';
import 'package:dating/screen/profile/someone_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFanDetailScreen extends GetView<MainController> {
  const MyFanDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
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

  PreferredSizeWidget _appBar() => PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: const CammitAppBar(
          showCloseButton: true,
          title: '나한테 관심 있는 친구',
        ),
      );
}
