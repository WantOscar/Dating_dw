import 'package:dating/controller/bottom_nav_controller.dart';
import 'package:dating/controller/user_controller.dart';
import 'package:dating/screen/alarm/alarm_screen.dart';
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
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0)),
            child: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: '탐색'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.chat_outlined), label: '채팅'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.notifications), label: '알림'),
                BottomNavigationBarItem(
                    icon:
                        ImageAvatar(imagePath: UserController.to.myInfo?.image),
                    label: '프로필'),
              ],
              onTap: controller.changeIndex,
              selectedItemColor: ThemeColor.fontColor,
              unselectedItemColor: Colors.grey,
              currentIndex: controller.index,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
            ),
          ),
          body: IndexedStack(
            index: controller.index,
            children: const [
              MainScreen(),
              SearchScreen(),
              ChattingScreen(),
              AlarmScreen(),
              ProfileScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
