import 'package:dating/controller/feed_controller.dart';
import 'package:dating/data/model/user.dart';
import 'package:dating/data/service/home_service.dart';
import 'package:dating/screen/main/my_fan_detail_screen.dart';
import 'package:dating/screen/main/my_favorite_detail_screen.dart';
import 'package:dating/screen/profile/someone_profile_screen.dart';
import 'package:dating/utils/enums.dart';
import 'package:dating/utils/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class MainController extends GetxController with UseToast {
  final HomeService homeService;

  final _scrollController = ScrollController();

  final Rx<Status> _isLoading = Rx<Status>(Status.loaded);
  Status get isLoading => _isLoading.value;

  final Rx<List<User>> _recommendMembers = Rx<List<User>>([]);
  final Rx<List<User>> _myFavoriteMembers = Rx<List<User>>([]);
  final Rx<List<User>> _myFanMembers = Rx<List<User>>([]);

  final Rx<Status> _isFavoriteLoading = Rx<Status>(Status.loaded);

  final RxBool _isFavoriteLimit = false.obs;

  bool get isFavoriteLimit => _isFavoriteLimit.value;

  Status get isFavoriteLoading => _isFavoriteLoading.value;

  List<User> get recommendMembers => _recommendMembers.value;
  List<User> get myFavoriteMember => _myFavoriteMembers.value;
  List<User> get myFanMembers => _myFanMembers.value;

  MainController({required this.homeService});

  ScrollController get scrollController => _scrollController;

  @override
  void onInit() {
    super.onInit();
    _fetchData();
  }

  void _nextFavoriteMember() async {
    if (_isFavoriteLimit.value ||
        _isFavoriteLoading.value == Status.loading ||
        _scrollController.position.extentAfter >= 100) {
      return;
    }
    _isFavoriteLoading(Status.loading);
    final id = _myFavoriteMembers.value.last.id!;
    try {
      final result = await homeService.newFavoriteMembers(id);
      if (result.isNotEmpty) {
        _myFavoriteMembers.value.addAll(result);
        _myFavoriteMembers.refresh();
      } else {
        _isFavoriteLimit(true);
      }
    } catch (err) {
      debugPrint(err.toString());
    } finally {
      _isFavoriteLoading(Status.loaded);
    }
  }

  void _fetchData() async {
    _isLoading(Status.loading);
    try {
      final data = await homeService.getHomeDatas();
      _recommendMembers.value = data[0];
      _myFavoriteMembers.value = data[1];
      _myFanMembers.value = data[2];
    } on Exception catch (_) {
      showToast("서버와의 연결이 원할하지 않습니다.");
    } finally {
      _isLoading(Status.loaded);
      debugPrint(_myFavoriteMembers.value.length.toString());
    }
  }

  void myFavoriteDetailList() {
    _scrollController.addListener(_nextFavoriteMember);
    Get.to(() => const MyFavoriteDetailScreen());
  }

  void quitFavoriteDetail() {
    _scrollController.removeListener(_nextFavoriteMember);
    Get.back();
  }

  void myFanDetailList() {
    Get.to(() => const MyFanDetailScreen());
  }

  void otherProfile(User user) {
    Get.to(
      () => SomeoneProfileScreen(user: user),
    );
  }

  void requestChatAlarm() {
    showToast('채팅을 신청하였습니다!', gravity: ToastGravity.CENTER);
  }

  void moveToProfileScreen(User user) {
    Get.to(() => SomeoneProfileScreen(user: user));
    FeedController.to.fetchMyFeeds(user);
  }
}
