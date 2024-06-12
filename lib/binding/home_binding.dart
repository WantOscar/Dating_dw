import 'package:dating/controller/bottom_nav_controller.dart';
import 'package:dating/controller/chat_controller.dart';
import 'package:dating/controller/feed_controller.dart';
import 'package:dating/data/repository/feed_repository.dart';
import 'package:dating/data/service/chat_service.dart';
import 'package:dating/data/service/feed_service.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController(), permanent: true);
    Get.put(ChatController(service: ChatService()));
    Get.put(FeedController(
        feedService: FeedService(feedRepository: FeedRepository())));
  }
}
