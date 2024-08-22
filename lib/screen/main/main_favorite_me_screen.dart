import 'package:dating/Widget/common/icon_header.dart';
import 'package:dating/controller/main_controller.dart';
import 'package:dating/style/icon_shape.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainFavoriteMeScreen extends GetView<MainController> {
  const MainFavoriteMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return (controller.myFanMembers.isNotEmpty)
            ? Scaffold(
                appBar: const IconHeader(text: '나한테 관심 있는 친구'),
                body: SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                      controller.myFanMembers.length,
                      (index) => Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _miniProfile(),
                                _otherInformation(),
                                _sendChatRequest(),
                              ],
                            ),
                          ),
                          _divider(),
                        ],
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
                      fontWeight: FontWeight.w600),
                ),
              );
      },
    );
  }

  /// 나에게 관심표현을 한 상대 프로필 사진을 보여줌
  Widget _miniProfile() {
    return GestureDetector(
      // onTap: () => controller.otherProfile(),
      child: Container(
        width: Get.size.width * 0.13,
        height: Get.size.width * 0.13,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
          color: Colors.grey,
        ),
      ),
    );
  }

  /// 나에게 관심표현을 한 상대 이름, 나이를 보여줌
  Widget _otherInformation() {
    return const Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '홍길동',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 4),
          Row(
            children: [
              IconShape.iconFemale,
              Text(
                '20세',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 나에게 관심표현을 한 상대에게 채팅 신청 가능한 버튼
  Widget _sendChatRequest() {
    return GestureDetector(
      onTap: controller.requestChatAlarm,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: const Color(0xFFFF006B),
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Text(
          '채팅하기',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  /// 목록 나누는 선
  Widget _divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Divider(
        color: Color.fromARGB(255, 203, 201, 201),
        thickness: 0.5,
      ),
    );
  }
}
