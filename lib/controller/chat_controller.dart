import 'package:dating/controller/chatting_room_controller.dart';
import 'package:dating/data/model/chatting_room_model.dart';
import 'package:dating/data/model/user.dart';
import 'package:dating/data/service/chat_service.dart';
import 'package:dating/screen/chat/chatting_room_screen.dart';
import 'package:dating/utils/show_toast.dart';
import 'package:get/get.dart';

class ChatController extends GetxController
    with GetSingleTickerProviderStateMixin, UseToast {
  final ChatService service;
  final Rx<List<ChattingRoomModel>> _chattings =
      Rx<List<ChattingRoomModel>>([]);
  static ChatController get to => Get.find();
  ChatController({required this.service});

  List<ChattingRoomModel> get chattings => _chattings.value;

  @override
  void onInit() {
    getMyChattingList();
    super.onInit();
  }

  void getMyChattingList() async {
    final result = await service.getMyChattingList();
    if (result != null) {
      _chattings.value.clear();
      _chattings(result);
    }
  }

  void makeChattingRoom(User target) async {
    try {
      final chatRoomId = await service.makeChattingRoom(target.id!);
      Get.to(() => ChattingRoom(target: target), binding: BindingsBuilder(() {
        Get.put(ChattingRoomController(
            chatRoomId: chatRoomId, targetName: target.nickName!));
      }));
    } catch (err) {
      showToast(err.toString());
    }
  }
}
