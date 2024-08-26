import 'package:dating/Widget/chat/chatting_box.dart';
import 'package:dating/controller/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeetingChatScreen extends StatelessWidget {
  const MeetingChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 70),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            GetX<ChatController>(builder: (controller) {
              return Column(
                children: List.generate(
                  controller.meetingChattings.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: GestureDetector(
                      child: ChattingBox(
                        chat: controller.meetingChattings[index],
                      ),
                      // onTap: () {
                      //   Get.to(
                      //       () => ChattingRoom(
                      //             target:
                      //                 controller.chattings[index].,
                      //           ), binding: BindingsBuilder(() {
                      //     Get.put(ChattingRoomController(
                      //         chatRoomId: controller.chattings[index].id,
                      //         targetName: controller.chattings[index].name));
                      //   }));
                      // },
                    ),
                  ),
                ),
              );
            }),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
