import 'package:dating/widget/main/circle_avatar.dart';
import 'package:dating/screen/profile/someone_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InterestedFriendsBox extends StatelessWidget {
  const InterestedFriendsBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          50,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Avatar(
              onTap: () {
                Get.to(() => const SomeoneProfileScreen());
              },
            ),
          ),
        ),
      ),
    );
  }
}
