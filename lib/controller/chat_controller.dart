import 'package:dating/controller/chatting_room_controller.dart';
import 'package:dating/data/model/chatting_room_model.dart';
import 'package:dating/data/model/user.dart';
import 'package:dating/data/repository/user_repository.dart';
import 'package:dating/data/service/chat_service.dart';
import 'package:dating/screen/chat/chatting_room_screen.dart';
import 'package:dating/utils/api_urls.dart';
import 'package:dating/utils/dio_intercepter.dart';
import 'package:dating/utils/show_toast.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ChatController extends GetxController
    with GetSingleTickerProviderStateMixin, UseToast {
  final ChatService service;
  final Rx<List<ChattingRoomModel>> _personalChattings =
      Rx<List<ChattingRoomModel>>([]);

  final Rx<List<ChattingRoomModel>> _meetingChattings =
      Rx<List<ChattingRoomModel>>([]);
  static ChatController get to => Get.find();
  ChatController({required this.service});

  List<ChattingRoomModel> get personalChattings => _personalChattings.value;

  List<ChattingRoomModel> get meetingChattings => _meetingChattings.value;

  @override
  void onInit() {
    getMyChattingList();
    super.onInit();
  }

  void getMyChattingList() async {
    final result = await service.getMyChattingList();
    if (result != null) {
      _personalChattings.value.clear();
      _personalChattings(result);
    }
  }

  void makeChattingRoom(User target) async {
    try {
      final chatRoomId = await service.makeChattingRoom(target.id!);
      Get.to(() => ChattingRoom(target: target), binding: BindingsBuilder(() {
        Get.put(ChattingRoomController(
            userRepository: UserRepository(
                dio: Dio(BaseOptions(baseUrl: ApiUrl.baseUrl))
                  ..interceptors.add(AuthInterceptor())
                  ..interceptors.add(BaseIntercepter())),
            chatRoomId: chatRoomId,
            targetName: target.nickName!));
      }));
    } catch (err) {
      showToast(err.toString());
    }
  }
}
