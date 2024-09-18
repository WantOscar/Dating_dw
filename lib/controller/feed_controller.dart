import 'package:dating/controller/feed_write_controller.dart';
import 'package:dating/data/model/feed.dart';
import 'package:dating/data/repository/feed_repository.dart';
import 'package:dating/screen/search/feed_write_screen.dart';
import 'package:dating/utils/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedController extends GetxController with UseToast {
  final RxBool _isLoading = false.obs;
  final Rx<List<Feed>> _feeds = Rx<List<Feed>>([]);
  final FeedRepositoryImpl feedRepository;
  final RxBool _nextLoading = false.obs;

  bool get nextLoading => _nextLoading.value;

  bool _isFeedLimit = false;

  static FeedController get to => Get.find();

  final ScrollController _scrollController = ScrollController();

  ScrollController get scrollController => _scrollController;

  bool get isLoading => _isLoading.value;

  List<Feed> get feeds => _feeds.value;

  FeedController({
    required this.feedRepository,
  });

  @override
  void onReady() {
    fetchFeeds();
    _scrollController.addListener(_nextLoad);
    super.onReady();
  }

  void fetchFeeds() async {
    final result = await feedRepository.getFeeds();
    _feeds(result);
  }

  void _nextLoad() async {
    if (!_isFeedLimit &&
        !_nextLoading.value &&
        !_isLoading.value &&
        _scrollController.position.extentAfter >= 100) {
      _nextLoading(true);
      final id = _feeds.value.last.id!;
      try {
        final newFeeds = await feedRepository.getNextFeeds(id);
        if (newFeeds.isEmpty) {
          _isFeedLimit = true;
        } else {
          _feeds.value.addAll(newFeeds);
          _feeds.refresh();
        }
      } on Exception catch (e) {
        showToast(e.toString());
      } finally {
        _nextLoading(false);
      }
    }
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
