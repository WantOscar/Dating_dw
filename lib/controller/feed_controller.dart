import 'package:dating/data/model/feed.dart';
import 'package:dating/data/repository/feed_repository.dart';
import 'package:dating/screen/search/feed_write_screen.dart';
import 'package:dating/style/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedController extends GetxController {
  final FeedRepositoryImpl feedRepository;

  final RxBool _isLoading = false.obs;
  final Rx<List<Feed>> _feeds = Rx<List<Feed>>([]);
  final Rx<List<Feed>> _myFeeds = Rx<List<Feed>>([]);

  bool get isLoading => _isLoading.value;
  List<Feed> get feeds => _feeds.value;
  List<Feed> get historys => _myFeeds.value;

  static FeedController get to => Get.find();

  FeedController({
    required this.feedRepository,
  });

  @override
  void onInit() {
    getAllFeeds();
    super.onInit();
  }

  /// 전체 피드 조회하는 함수
  void getAllFeeds() async {
    try {
      _isLoading(true);
      final result = await feedRepository.getAllFeeds();
      _feeds(result);
    } on Exception catch (e) {
    } finally {
      _isLoading(false);
    }
  }

  /// 피드를 작성하고 작성한 데이터를 보내는 함수
  void writeFeed(Feed feed) async {
    final result = await feedRepository.postFeed(feed.toJson());
    _feeds.value.add(result);
    _feeds.refresh();
  }

  /// 본인이 작성한 피드를 조회하는 함수
  void fetchMyFeeds(String nickName) async {
    _isLoading(true);
    try {
      final data = {"nickName": nickName};
      final result = await feedRepository.getMyFeeds(data);
      _myFeeds(result);
    } on Exception catch (e) {
      print('error: $e');
    } finally {
      _isLoading(false);
    }
  }

  /// 본인이 작성한 피드를 수정하는 함수
  void updateFeed(Feed feed) async {
    final result = await feedRepository.patchFeed(feed.toJson());
    final idx = _feeds.value.indexOf(feed);
    _feeds.value.replaceRange(idx, idx, [result]);
    _feeds.refresh();
  }

  /// 본인이 작성한 피드를 삭제하는 함수
  void deleteFeed(int id) async {
    await feedRepository.deleteFeed(id);
  }

  /// 피드 작성 화면으로 이동하며 의존성 주입
  void moveToWriteScreen() {
    Get.to(
      () => const FeedWriteScreen(),
    );
  }

  /// 탐색창의 피드를 눌렀을 때 세부 내용을 보여주는 함수
  void showFeedOption() {
    Get.bottomSheet(
      backgroundColor: Colors.transparent,
      Wrap(
        children: [
          Container(
            padding: const EdgeInsets.all(3.0),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  /// 차단버튼
                  InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10.0),
                      width: double.infinity,
                      child: Text(
                        '차단',
                        style: TextStyle(
                          color: ThemeColor.fontColor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    onTap: () {},

                    /// 프로필 내 나의 피드 작업 끝나면 차단 연결할 것.
                  ),

                  /// 나누는 선
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Divider(),
                  ),

                  /// 취소버튼
                  InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10.0),
                      child: const Text(
                        '취소',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    onTap: () {
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 프로필창의 내 피드를 눌렀을 때 세부 내용을 보여주는 함수
  void showMyFeedOption({Feed? feed}) {
    Get.bottomSheet(
      backgroundColor: Colors.transparent,
      Wrap(
        children: [
          Container(
            padding: const EdgeInsets.all(3.0),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  /// 수정버튼
                  InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10.0),
                      width: double.infinity,
                      child: Text(
                        '수정',
                        style: TextStyle(
                          color: ThemeColor.fontColor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    onTap: () {
                      Get.to(
                        const FeedWriteScreen(),
                      );
                    },
                  ),

                  /// 나누는 선
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Divider(),
                  ),

                  /// 삭제버튼
                  InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10.0),
                      child: const Text(
                        '삭제',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    onTap: () {},
                  ),

                  /// 나누는 선
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Divider(),
                  ),

                  /// 취소버튼
                  InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10.0),
                      child: const Text(
                        '취소',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    onTap: () {
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
