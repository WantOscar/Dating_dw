import 'package:dating/Widget/common/notification_window.dart';
import 'package:dating/Widget/common/warning_window.dart';
import 'package:dating/controller/member_block_controller.dart';
import 'package:dating/controller/user_controller.dart';
import 'package:dating/data/model/feed.dart';
import 'package:dating/data/model/user.dart';
import 'package:dating/data/repository/feed_repository.dart';
import 'package:dating/screen/home_screen.dart';
import 'package:dating/screen/search/feed_write_screen.dart';
import 'package:dating/style/constant.dart';
import 'package:flutter/material.dart';
import 'package:dating/utils/show_toast.dart';
import 'package:get/get.dart';

class FeedController extends GetxController with UseToast {
  final FeedRepositoryImpl feedRepository;
  final User? user;

  final RxBool _isLoading = false.obs;
  final Rx<List<Feed>> _feeds = Rx<List<Feed>>([]);
  final Rx<List<Feed>> _myFeeds = Rx<List<Feed>>([]);
  String _title = "";
  String _content = "";

  final RxBool _nextLoading = false.obs;

  bool get nextLoading => _nextLoading.value;

  bool _isFeedLimit = false;

  final ScrollController _scrollController = ScrollController();

  ScrollController get scrollController => _scrollController;

  bool get isLoading => _isLoading.value;
  List<Feed> get feeds => _feeds.value;
  List<Feed> get historys => _myFeeds.value;

  static FeedController get to => Get.find();

  FeedController({
    required this.feedRepository,
    this.user,
  });

  @override
  void onInit() {
    getAllFeeds();
    super.onInit();
  }

  @override
  void onReady() {
    fetchFeeds();
    _scrollController.addListener(_nextLoad);
    super.onReady();
  }

  void fetchFeeds() async {
    final result = await feedRepository.getAllFeeds();
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

  /// 피드 작성을 취소할건지 물어보고 뒤로 돌아가는 함수
  void cancel() {
    Get.dialog(
      NotificationWindow(
        title: '피드 작성 취소',
        content: '현재 입력사항을 모두 취소하고 돌아가시겠습니까?',
        confirmLabel: "확인",
        cancelLabel: "취소",
        onConfirm: () {
          Get.until((route) => route.isFirst);
        },
        onCancel: () => Get.until((route) => route.isFirst),
      ),
    );
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
    final User user = UserController.to.myInfo!;
    result.user = user;
    result.nickName = user.nickName!;
    print(result.user?.image);
    _feeds.value.add(result);
    _feeds.refresh();
  }

  /// 탐색창의 피드를 눌렀을 때 세부 내용을 보여주는 함수
  void showFeedOption(Feed feed) {
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
                    onTap: () async {
                      await MemberBlockController.to.memberBlock(feed.id!);
                    },
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
  void updateFeed(Feed updatedFeed) async {
    // final result = await feedRepository.patchFeed(feed.toJson());
    // final idx = _feeds.value
    //     .indexOf(_feeds.value.where((feed) => feed.id == feed.id).first);
    // _feeds.value.replaceRange(idx, idx, [result]);
    // _feeds.refresh();
    try {
      final result = await feedRepository.patchFeed(updatedFeed.toJson());
      final index =
          _feeds.value.indexWhere((feed) => feed.id == updatedFeed.id);
      if (index != -1) {
        _feeds.value[index] = result;
        _feeds.refresh();
      }
    } catch (e) {
      print('Error updating feed: $e');
    }
  }

  /// 본인이 작성한 피드를 삭제하는 함수
  void deleteFeed(int id) async {
    await feedRepository.deleteFeed(id);
    _feeds.value.removeWhere((feed) => feed.id == id);
    _myFeeds.value.removeWhere((feed) => feed.id == id);
    _feeds.refresh();
    _myFeeds.refresh();
  }

  /// 수정한 글을 적용시킬지 물어보는 dialog 함수.
  void updateDialog(Feed feed) async {
    Get.dialog(WarningWindow(
      titleText: '피드 수정 완료',
      explainText: '수정을 완료하시겠습니까?',
      onTap: () {
        updateFeed(feed);
        Get.off(() => const HomeScreen());
      },
      btnText: "피드 수정",
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
                    onTap: () {
                      Get.dialog(
                        WarningWindow(
                            onTap: () {
                              deleteFeed(feed.id!);
                              Get.until((route) => route.isFirst);
                            },
                            titleText: '피드 삭제',
                            explainText: '이 피드를 정말로 삭제하시겠습니까?',
                            btnText: '삭제'),
                      );

                      // deleteFeed(feed.id!);
                      // Get.back();
                      // Get.off(() => const HomeScreen());
                    },
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
