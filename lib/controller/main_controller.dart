import 'package:dating/data/model/user.dart';
import 'package:dating/data/service/home_service.dart';
import 'package:dating/screen/main/my_fan_detail_screen.dart';
import 'package:dating/screen/main/my_favorite_detail_screen.dart';
import 'package:dating/screen/profile/someone_profile_screen.dart';
import 'package:dating/utils/enums.dart';
import 'package:dating/utils/show_toast.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class MainController extends GetxController with UseToast {
  final HomeService homeService;

  final Rx<Status> _isLoading = Rx<Status>(Status.loaded);
  Status get isLoading => _isLoading.value;

  final Rx<List<User>> _recommendMembers = Rx<List<User>>([]);
  final Rx<List<User>> _myFavoriteMembers = Rx<List<User>>([]);
  final Rx<List<User>> _myFanMembers = Rx<List<User>>([]);

  List<User> get recommendMembers => _recommendMembers.value;
  List<User> get myFavoriteMember => _myFavoriteMembers.value;
  List<User> get myFanMembers => _myFanMembers.value;

  MainController({required this.homeService});

  @override
  void onInit() {
    super.onInit();
    _fetchData();
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
    }
  }

  void myFavoriteDetailList() {
    Get.to(() => const MyFavoriteDetailScreen());
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
}
