import 'dart:ui';

import 'package:dating/Widget/chat/chat_bubble.dart';
import 'package:dating/controller/chatting_room_controller.dart';
import 'package:dating/data/model/message_model.dart';
import 'package:dating/data/model/user.dart';
import 'package:dating/style/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChattingRoom extends GetView<ChattingRoomController> {
  final User target;
  const ChattingRoom({
    super.key,
    required this.target,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: AppBar().preferredSize,
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaY: 10.0, sigmaX: 10.0),
              child: AppBar(
                leading: GestureDetector(
                  onTap: controller.back,
                  child: Icon(
                    Icons.arrow_back,
                    color: ThemeColor.fontColor,
                  ),
                ),
                backgroundColor: Colors.white.withOpacity(0.7),
                elevation: 0.0,
                title: Text(
                  target.nickName!,
                  style: TextStyle(
                      color: ThemeColor.fontColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            _chatBody(),
            _messageInput(),
          ],
        ),
        extendBodyBehindAppBar: true,
      ),
    );
  }

  Widget _chatBody() {
    return Expanded(
        child: Obx(
      () => SingleChildScrollView(
        reverse: true,
        child: Column(children: [
          SizedBox(
            height: AppBar().preferredSize.height * 2,
          ),

          /// 이전 채팅 목록
          ...List.generate(controller.previous.length, (index) {
            MessageModel message = controller.previous[index];
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: ChatBubble(
                message: message,
                user: target,
              ),
            );
          }),

          /// 현재 채팅 목록
          ...List.generate(controller.messages.length, (index) {
            MessageModel message = controller.messages[index];
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: ChatBubble(
                message: message,
                user: target,
              ),
            );
          })
        ]),
      ),
    ));
  }

  /// 사용자는 메시지 입력 위젯을 이용해서
  /// 상대방에게 보내고자하는 메시지를 입력할 수 있음.
  /// 메시지가 입력되고 전송되면
  /// 사용자의 메시지 박스의 내용을 모두 지움.
  Widget _messageInput() => SafeArea(
        top: false,
        left: false,
        right: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
          child: TextField(
            cursorColor: Colors.grey,
            textAlignVertical: TextAlignVertical.center,
            controller: controller.message,
            style: const TextStyle(color: Colors.black87, fontSize: 15),
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(24.0)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(24.0)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(24.0)),
                isDense: true,
                isCollapsed: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 1.0),
                suffixIcon: GestureDetector(
                  onTap: controller.sendMessage,
                  child: const Icon(
                    Icons.send,
                    color: Colors.grey,
                    size: 25,
                  ),
                ),
                filled: true,
                fillColor: const Color(0xffdfdfdf)),
          ),
        ),
      );
}
