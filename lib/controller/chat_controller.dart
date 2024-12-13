import 'package:dating/binding/chat_room_controller_binding.dart';
import 'package:dating/data/model/chatting_room_model.dart';
import 'package:dating/data/model/user.dart';
import 'package:dating/data/service/chat_service.dart';
import 'package:dating/screen/chat/chatting_room_screen.dart';
import 'package:dating/utils/show_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ChatType { dm, meeting }

class ChatController extends GetxController
    with GetSingleTickerProviderStateMixin, UseToast, WidgetsBindingObserver {
  final ChatService service;
  final Rx<List<ChattingRoomModel>> _personalChattings =
      Rx<List<ChattingRoomModel>>([]);

  final Rx<List<ChattingRoomModel>> _meetingChattings =
      Rx<List<ChattingRoomModel>>([]);
  static ChatController get to => Get.find();
  ChatController({required this.service});

  List<ChattingRoomModel> get personalChattings => _personalChattings.value;

  List<ChattingRoomModel> get meetingChattings => _meetingChattings.value;

  List<ChattingRoomModel> get allChattings =>
      _personalChattings.value + _meetingChattings.value;

  @override
  void onInit() {
    getMyChattingList();
    WidgetsBinding.instance.addObserver(this);
    super.onInit();
  }

  void readChat(ChattingRoomModel chat) {
    for (var c in allChattings) {
      if (c.id == chat.id) {
        c.isRead = true;
        _personalChattings.refresh();
        _meetingChattings.refresh();
        break;
      }
    }
    service.readChat(chat.id);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // 앱의 라이프사이클 상태 변화에 따른 처리
    if (state == AppLifecycleState.resumed) {
      // 앱이 포그라운드로 돌아왔을 때
      getMyChattingList();
      // 여기서 채팅 메시지 상태를 갱신하거나 UI를 업데이트
    } else if (state == AppLifecycleState.paused) {
      // 앱이 백그라운드로 전환될 때
      print("앱이 백그라운드로 전환됨");
    }
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  void getMyChattingList() async {
    service.getMyPersonalChattingList().then((dms) {
      _personalChattings(dms);
    });
    service.getMyMeetingChattingList().then((meetings) {
      _meetingChattings(meetings);
    });
  }

  void updateLastMessage(int chatRoomId, String message) {
    _personalChattings.value
        .where((chat) => chat.id == chatRoomId)
        .first
        .updateLastMessage(message);
    _personalChattings.refresh();
  }

  void makeChattingRoom(User target, ChatType type) async {
    try {
      final chatRoomId = await service.makeChattingRoom(target.id!, type.name);
      final ChattingRoomModel chat = ChattingRoomModel(
          id: chatRoomId,
          isRead: true,
          name: target.nickName,
          image: target.image,
          lastMessage: "",
          time: DateTime.now().toIso8601String());

      if (type == ChatType.dm) {
        _personalChattings.value.add(chat);
        _personalChattings.refresh();
      } else if (type == ChatType.meeting) {
        _meetingChattings.value.add(chat);
        _meetingChattings.refresh();
      }
      Get.to(
          () => ChattingRoom(
                target: target,
              ),
          binding: ChatRoomControllerBinding(
              chat: chat, targetName: target.nickName!));
    } on DioException catch (err) {
      showToast(err.message!);
    }
  }

  void quit(int id) {
    _personalChattings.value.removeWhere((chat) => chat.id == id);
    _meetingChattings.value.removeWhere((chat) => chat.id == id);
    _personalChattings.refresh();
    _meetingChattings.refresh();
  }
}
