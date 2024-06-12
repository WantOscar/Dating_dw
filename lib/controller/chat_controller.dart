import 'package:dating/data/model/chatting_room_model.dart';
import 'package:dating/data/service/chat_service.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
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

  void makeChattingRoom(int id) {
    service.makeChattingRoom(id);
  }
}
