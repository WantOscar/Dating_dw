import 'package:dating/Widget/common/warning_window.dart';
import 'package:dating/data/model/feed.dart';
import 'package:dating/data/repository/feed_repository.dart';
import 'package:dating/screen/home_screen.dart';
import 'package:dating/screen/profile/profile_screen.dart';
import 'package:dating/screen/search/feed_write_screen.dart';
import 'package:dating/style/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedController extends GetxController {
  final FeedRepositoryImpl feedRepository;

  final RxBool _isLoading = false.obs;
  final Rx<List<Feed>> _feeds = Rx<List<Feed>>([]);
  final Rx<List<Feed>> _myFeeds = Rx<List<Feed>>([]);
  String _title = "";
  String _content = "";

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

  /// 피드 작성을 취소할건지 물어보고 뒤로 돌아가는 함수
  void cancel() {
    Get.dialog(WarningWindow(
      titleText: '피드 작성 취소',
      explainText: '현재 입력사항을 모두 취소하고 돌아가시겠습니까?',
      onTap: () {
        Get.until((route) => route.isFirst);
      },
      btnText: "작성취소",
    ));
  }

  void titleChange(String value) {
    _title = value;
  }

  void contentChange(String value) {
    _content = value;
  }

  /// 작성한 글을 적용시킬지 물어보는 dialog 함수.
  void completeFeed() {
    final Feed feed = Feed(title: _title, content: _content);

    Get.dialog(WarningWindow(
      titleText: '피드 작성 완료',
      explainText: '작성을 완료하시겠습니까?',
      onTap: () {
        writeFeed(feed);
        Get.off(() => const HomeScreen());
      },
      btnText: "피드 생성",
    ));
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

                    /// 프로필 내 나의 피드 작업 끝나면 차단 연결할 것.
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

  ///ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ Profile ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

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

  /// 본인이 수정한 피드를 적용시키는 함수
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

  /// 수정한 글을 적용시킬지 물어보는 dialog 함수.
  void upDateFeed(Feed feed) async {
    Get.dialog(WarningWindow(
      titleText: '피드 작성 완료',
      explainText: '작성을 완료하시겠습니까?',
      onTap: () {
        updateFeed(feed);
        Get.off(() => const ProfileScreen());
      },
      btnText: "피드 생성",
    ));
  }

  /// 프로필창의 내 피드를 눌렀을 때 세부 내용을 보여주는 함수
  void showMyFeedOption(Feed feed) {
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
                        FeedWriteScreen(
                          feed: feed,
                          title: feed.title,
                          content: feed.content,
                          isEdit: true,
                        ),
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
