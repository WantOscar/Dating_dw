import 'package:dating/controller/feed_write_controller.dart';
import 'package:dating/data/model/feed.dart';
import 'package:dating/data/repository/feed_repository.dart';
import 'package:dating/screen/search/feed_write_screen.dart';
import 'package:get/get.dart';

class FeedController extends GetxController {
  final FeedRepositoryImpl feedRepository;

  final RxBool _isLoading = false.obs;
  final Rx<List<Feed>> _feeds = Rx<List<Feed>>([]);
  final Rx<List<Feed>> _historys = Rx<List<Feed>>([]);

  bool get isLoading => _isLoading.value;
  List<Feed> get feeds => _feeds.value;
  List<Feed> get historys => _historys.value;

  static FeedController get to => Get.find();

  FeedController({
    required this.feedRepository,
  });

  @override
  void onReady() {
    fetchFeeds();
    super.onReady();
  }

  /// 전체 피드 조회하는 함수
  void fetchFeeds() async {
    final result = await feedRepository.getAllFeeds();
    _feeds(result);
  }

  /// 피드를 작성하고 작성한 데이터를 보내는 함수
  void writeFeed(Feed feed) async {
    final result = await feedRepository.postFeed(feed.toJson());
    _feeds.value.add(result);
    _feeds.refresh();
  }

  /// 본인이 작성한 피드를 조회하는 함수
  void fetchHistory(String nickName) async {
    final result = await feedRepository.getHistory(nickName);
    _historys(result);
  }

  /// 본인이 작성한 피드를 수정하는 함수
  void updateFeed(Feed feed) async {
    final result = await feedRepository.patchFeed(feed.toJson());
    fetchFeeds();
  }

  /// 본인이 작성한 피드를 삭제하는 함수
  void deleteFeed(int id) async {
    await feedRepository.deleteFeed(id);
    fetchFeeds();
  }

  /// 피드 작성 화면으로 이동하며 의존성 주입
  void moveToWriteScreen() {
    Get.to(
      () => const FeedWriteScreen(),
      binding: BindingsBuilder(() {
        Get.put(FeedWriteController());
      }),
    );
  }
}
