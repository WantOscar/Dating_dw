import 'package:dating/controller/feed_write_controller.dart';
import 'package:dating/data/model/feed.dart';
import 'package:dating/data/repository/feed_repository.dart';
import 'package:dating/screen/search/feed_write_screen.dart';
import 'package:get/get.dart';

class FeedController extends GetxController {
  final RxBool _isLoading = false.obs;
  final Rx<List<Feed>> _feeds = Rx<List<Feed>>([]);
  final FeedRepositoryImpl feedRepository;

  static FeedController get to => Get.find();

  bool get isLoading => _isLoading.value;

  List<Feed> get feeds => _feeds.value;

  FeedController({
    required this.feedRepository,
  });

  @override
  void onReady() {
    fetchFeeds();
    super.onReady();
  }

  void fetchFeeds() async {
    final result = await feedRepository.getAllFeeds();
    _feeds(result);
  }

  void writeFeed(Feed feed) async {
    final result = await feedRepository.postFeed(feed.toJson());
    _feeds.value.add(result);
    _feeds.refresh();
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
