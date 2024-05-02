import 'dart:convert';

import 'package:dating/data/model/message_model.dart';
import 'package:dating/data/provider/message_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// 채팅방에서 필요한 비즈니스 로직을 수행하는 컨트롤러임.
/// 채팅 전송, 채팅 내용을 불러오는 역활을 수행함.
class ChattingRoomController extends GetxController {
  final int chatRoomId;
  late final WebSocketChannel channel;
  final Rx<List<MessageModel>> _messages = Rx<List<MessageModel>>([]);
  final _service = MessageService(storage: const FlutterSecureStorage());
  ChattingRoomController({required this.chatRoomId});
  final _messageController = TextEditingController();

  TextEditingController get message => _messageController;

  static ChattingRoomController get to => Get.find();
  List<MessageModel> get messages => _messages.value;

  @override
  void onReady() {
    _connectChannel();
    super.onReady();
  }

  /// 서버의 채팅 소켓 서버와 연결하는 메소드

  void _connectChannel() {
    channel =
        WebSocketChannel.connect(Uri.parse("ws://13.124.21.82:8082/ws/chat"));
    _fetchData();
  }

  void _fetchData() async {
    final data = await _service.getMessages(chatRoomId);
    if (data != null) {
      _messages.value = data;
      _messages.refresh();
    }
  }

  /// 사용자가 입력한 채팅을 웹소켓 서버로
  /// 전송하는 메소드
  /// 채팅방의 아이디가 필요함.
  void sendMessage() {
    final message = MessageModel.toJson(
        memberId: 2,
        chatRoomId: chatRoomId.toString(),
        message: _messageController.text.toString());

    channel.sink.add(jsonEncode(message));
    _fetchData();
    _messageController.clear();
  }
}
