import 'package:dating/controller/bottom_nav_controller.dart';
import 'package:dating/controller/chat_controller.dart';
import 'package:dating/data/service/chat_service.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController(), permanent: true);
    Get.put(ChatController(service: ChatService()));
  }
}
