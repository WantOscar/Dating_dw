import 'dart:convert';

import 'package:dating/controller/chat_controller.dart';
import 'package:dating/controller/user_controller.dart';
import 'package:dating/data/model/chatting_room_model.dart';
import 'package:dating/data/model/fcm_send.dart';
import 'package:dating/data/model/message_model.dart';
import 'package:dating/data/repository/user_repository.dart';
import 'package:dating/data/service/chat_service.dart';
import 'package:dating/screen/profile/someone_profile_screen.dart';
import 'package:dating/utils/show_toast.dart';
import 'package:dating/widget/common/notification_window.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// 채팅방에서 필요한 비즈니스 로직을 수행하는 컨트롤러임.
/// 채팅 전송, 채팅 내용을 불러오는 역활을 수행함.
class ChattingRoomController extends GetxController with UseToast {
  final String targetName;
  final ChattingRoomModel chat;

  late final WebSocketChannel channel;
  final Rx<List<MessageModel>> _previous = Rx<List<MessageModel>>([]);
  final Rx<List<MessageModel>> _messages = Rx<List<MessageModel>>([]);
  final ChatServiceImpl chatService;
  final UserRepositoryImpl userRepository;
  ChattingRoomController({
    required this.chatService,
    required this.userRepository,
    required this.chat,
    required this.targetName,
  });

  final _messageController = TextEditingController();

  TextEditingController get message => _messageController;

  static ChattingRoomController get to => Get.find();
  List<MessageModel> get previous => _previous.value;
  List<MessageModel> get messages => _messages.value;

  @override
  void onReady() {
    _connectChannel();
    _readChat();
    super.onReady();
  }

  /// 채팅 읽음 API
  void _readChat() {
    ChatController.to.readChat(chat);
  }

  /// 서버의 채팅 소켓 서버와 연결하는 메소드
  void _connectChannel() {
    fetchData();
    channel =
        IOWebSocketChannel.connect(Uri.parse("ws://15.164.91.35:8082/ws/chat"));
    channel.stream.listen(
      (message) {
        final msg = MessageModel.fromJson(jsonDecode(message));
        _messages.value.add(msg);
        _messages.refresh();
        ChatController.to.updateLastMessage(chat.id, msg.message!);
      },
      onError: (error) {
        showToast("서버와의 통신이 원할하지 않습니다.");
      },
      onDone: () {
        debugPrint("연결 종료");
      },
    );
  }

  /// 서버로 부터 이전 대화를 불러오는 메소드
  void fetchData() async {
    try {
      final data = await chatService.getMessages(chat.id);
      _previous.value = data;
      _previous.refresh();
    } on Exception catch (_) {
      showToast("서버와의 통신이 원할하지 않습니다.");
    }
  }

  /// 사용자가 입력한 채팅을 웹소켓 서버로
  /// 전송하는 메소드
  /// 채팅방의 아이디가 필요함.
  void sendMessage() {
    if (_messageController.text.isEmpty) {
      return;
    }
    final message = MessageModel(
      nickName: UserController.to.myInfo!.nickName,
      message: _messageController.text.toString(),
      messageType: "TALK",
      createAt: DateFormat('yyyy-MM-dd-HH:mm:ss').format(DateTime.now()),
      chatRoomId: chat.id,
    );

    final fcmSend = FCMSend(
      targetName: targetName,
      title: UserController.to.myInfo!.nickName!,
      body: _messageController.text.toString(),
      chatRoomNo: chat.id,
    );

    channel.sink.add(jsonEncode(message.toJson()));
    try {
      chatService.sendPushNotification(fcmSend.toJson());
      _messageController.clear();
    } on DioException catch (err) {
      showToast(err.toString());
    }
  }

  void moveToProfileScreen(String nickName) async {
    try {
      final query = {"nickName": nickName};
      final user = await userRepository.getUser(query);
      Get.to(() => SomeoneProfileScreen(user: user));
    } on Exception catch (err) {
      debugPrint(err.toString());
    }
  }

  void quit() {
    Get.dialog(
      NotificationWindow(
        content: "채팅방을 나가면 상대방과 대화 내용이 모두 삭제됩니다.",
        title: "채팅방을 나가시겠습니까?",
        onConfirm: () {
          final message = MessageModel(
            nickName: UserController.to.myInfo!.nickName,
            message: "${UserController.to.myInfo!.nickName}님이 대화방을 나갔습니다.",
            messageType: "QUIT",
            createAt: DateFormat('yyyy-MM-dd-HH:mm:ss').format(DateTime.now()),
            chatRoomId: chat.id,
          );
          channel.sink.add(jsonEncode(message.toJson()));
          ChatController.to.quit(chat.id);
          Get.until((route) => route.isFirst);
        },
        confirmLabel: "나가기",
        onCancel: Get.back,
        cancelLabel: "취소",
      ),
    );
  }
}
