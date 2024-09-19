import 'dart:ui';

import 'package:dating/controller/bottom_nav_controller.dart';
import 'package:dating/controller/user_controller.dart';
import 'package:dating/screen/chat/chatting_screen.dart';
import 'package:dating/screen/main/main_screen.dart';
import 'package:dating/screen/profile/profile_screen.dart';
import 'package:dating/screen/search/search_screen.dart';
import 'package:dating/style/constant.dart';
import 'package:dating/widget/common/image_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<BottomNavController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: controller.popAction,
      child: Obx(
        () => Scaffold(
          extendBody: true,
          bottomNavigationBar: Builder(builder: (context) {
            return _bottomNav(context);
          }),
          body: _body(),
        ),
      ),
    );
  }

  Widget _bottomNav(BuildContext context) => Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0)),
            border: Border.all(width: 2.0, color: Colors.white)),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 20.0,
              sigmaY: 20.0,
            ),
            child: BottomNavigationBar(
              items: [
                const BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: '홈'),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: '탐색'),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.chat_outlined), label: '채팅'),
                // const BottomNavigationBarItem(
                //     icon: Icon(Icons.notifications), label: '알림'),
                BottomNavigationBarItem(
                    icon:
                        ImageAvatar(imagePath: UserController.to.myInfo?.image),
                    label: '프로필'),
              ],
              backgroundColor:
                  Theme.of(context).colorScheme.tertiary.withOpacity(0.7),
              onTap: controller.changeIndex,
              selectedItemColor: ThemeColor.fontColor,
              unselectedItemColor: Colors.grey,
              currentIndex: controller.index,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
            ),
          ),
        ),
      );

  Widget _body() => IndexedStack(
        index: controller.index,
        children: const [
          MainScreen(),
          SearchScreen(),
          ChattingScreen(),
          // AlarmScreen(),
          ProfileScreen(),
        ],
      );
}
