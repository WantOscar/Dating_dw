import 'package:dating/Widget/common/icon_header.dart';
import 'package:dating/Widget/main/my_favorite_avatar.dart';
import 'package:dating/controller/main_controller.dart';
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
                          child: MyFavoriteAvatar(user: user),
                        );
                      },
                    ),
                  ),
                )
              : const Column(
                  children: [
                    Text(
                      '내가 관심있는 사람이 아직 없습니다.',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }

  // /// 내가 관심표현을 한 상대 프로필 사진을 보여줌
  // Widget _miniProfile(int index) {
  //   final user = controller.myFavoriteMember[index];
  //   return GestureDetector(
  //     onTap: () {},
  //     child: Avatar(user: user),
  //   );
  // }

  // /// 내가 관심표현을 한 상대 이름, 나이를 보여줌
  // Widget _otherInformation() {
  //   return const Expanded(
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           '홍길동',
  //           style: TextStyle(
  //             fontSize: 15,
  //             color: Colors.black,
  //           ),
  //         ),
  //         SizedBox(height: 4),
  //         Row(
  //           children: [
  //             IconShape.iconFemale,
  //             Text(
  //               '20세',
  //               style: TextStyle(
  //                 fontSize: 12,
  //                 color: Colors.grey,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // /// 내가 관심표현을 한 상대에게 채팅 신청 가능한 버튼
  // Widget _sendChatRequest() {
  //   return GestureDetector(
  //     onTap: controller.requestChatAlarm,
  //     child: Container(
  //       padding: const EdgeInsets.all(8.0),
  //       decoration: BoxDecoration(
  //         color: const Color(0xFFFF006B),
  //         borderRadius: BorderRadius.circular(50),
  //       ),
  //       child: const Text(
  //         '채팅하기',
  //         style: TextStyle(
  //           color: Colors.white,
  //           fontSize: 12,
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
