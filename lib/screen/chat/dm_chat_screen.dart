import 'package:dating/widget/chat/chatting_box.dart';
import 'package:dating/binding/chat_room_controller_binding.dart';
import 'package:dating/controller/chat_controller.dart';
import 'package:dating/data/model/user.dart';
import 'package:dating/screen/chat/chatting_room_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DmChatScreen extends StatelessWidget {
  const DmChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 70),
        child: Column(
          children: [
            const SizedBox(height: 20),
            GetX<ChatController>(builder: (controller) {
              return Column(
                children:
                    List.generate(controller.personalChattings.length, (index) {
                  final chat = controller.personalChattings[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: GestureDetector(
                      child: ChattingBox(
                        chat: controller.personalChattings[index],
                      ),
                      onTap: () {
                        final User user =
                            User(nickName: chat.name, image: chat.image);
                        Get.to(
                            () => ChattingRoom(
                                  target: user,
                                ),
                            binding: ChatRoomControllerBinding(
                                chatRoomId: chat.id,
                                targetName: user.nickName!));
                      },
                    ),
                  );
                }),
              );
            }),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
