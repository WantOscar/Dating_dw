import 'dart:convert';

import 'package:dating/controller/chat_controller.dart';
import 'package:dating/controller/user_controller.dart';
import 'package:dating/data/model/fcm_send.dart';
import 'package:dating/data/model/message_model.dart';
import 'package:dating/data/repository/user_repository.dart';
import 'package:dating/data/service/chat_service.dart';
import 'package:dating/screen/profile/someone_profile_screen.dart';
import 'package:dating/utils/show_toast.dart';
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
  final int chatRoomId;

  late final WebSocketChannel channel;
  final Rx<List<MessageModel>> _previous = Rx<List<MessageModel>>([]);
  final Rx<List<MessageModel>> _messages = Rx<List<MessageModel>>([]);
  final ChatServiceImpl chatService;
  final UserRepositoryImpl userRepository;
  ChattingRoomController({
    required this.chatService,
    required this.userRepository,
    required this.chatRoomId,
    required this.targetName,
  });

  final _messageController = TextEditingController();

  TextEditingController get message => _messageController;

  static ChattingRoomController get to => Get.find();
  List<MessageModel> get previous => _previous.value;
  List<MessageModel> get messages => _messages.value;

  @override
  void onInit() {
    _connectChannel();
    super.onInit();
  }

  /// 서버의 채팅 소켓 서버와 연결하는 메소드

  void _connectChannel() {
    channel =
        IOWebSocketChannel.connect(Uri.parse("ws://13.124.21.82:8082/ws/chat"));
    fetchData();
    channel.stream.listen(
      (message) {
        _messages.value.add(MessageModel.fromJson(jsonDecode(message)));
        _messages.refresh();
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
      final data = await chatService.getMessages(chatRoomId);
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
      chatRoomId: chatRoomId,
    );

    final fcmSend = FCMSend(
        targetName: targetName,
        title: UserController.to.myInfo!.nickName,
        body: _messageController.text.toString());

    channel.sink.add(jsonEncode(message.toJson()));
    try {
      chatService.sendPushNotification(fcmSend.toJson());
      _messageController.clear();
    } on DioException catch (err) {
      showToast(err.toString());
    }
  }

  void addChatLog(dynamic chat) {
    _messages.value.add(chat);
    _messages.refresh();
  }

  void back() async {
    await ChatController.to.getMyChattingList();
    Get.back();
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
}
