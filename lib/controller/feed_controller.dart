import 'package:dating/controller/feed_write_controller.dart';
import 'package:dating/data/model/feed.dart';
import 'package:dating/data/provider/feed_service.dart';
import 'package:dating/screen/search/feed_write_screen.dart';
import 'package:get/get.dart';

class FeedController extends GetxController {
  final Rx<List<Feed>> _feeds = Rx<List<Feed>>([]);
  final FeedService feedService;

  static FeedController get to => Get.find();

  List<Feed> get feeds => _feeds.value;

  FeedController({
    required this.feedService,
  });

  void writeFeed(Feed feed) async {
    final result = await feedService.postFeed(feed.toJson());
    if (result != null) {
      _feeds.value.add(result);
      _feeds.refresh();
    }
  }

  void moveToWriteScreen() {
    Get.to(
      () => const FeedWriteScreen(),
      binding: BindingsBuilder(() {
        Get.put(FeedWriteController());
      }),
    );
  }
}
