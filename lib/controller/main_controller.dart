import 'package:dating/data/model/user.dart';
import 'package:dating/data/service/home_service.dart';
import 'package:dating/screen/main/main_favorite_me_screen.dart';
import 'package:dating/screen/profile/someone_profile_screen.dart';
import 'package:dating/utils/show_toast.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class MainController extends GetxController with UseToast {
  final RxBool _isLoading = false.obs;
  final HomeService homeService;
  final Rx<List<User>> _recommendMembers = Rx<List<User>>([]);
  final Rx<List<User>> _myFavoriteMembers = Rx<List<User>>([]);
  final Rx<List<User>> _myFanMembers = Rx<List<User>>([]);

  bool get isLoading => _isLoading.value;

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
    final data = await homeService.getHomeDatas();

    _recommendMembers.value = data[0];
    _myFavoriteMembers.value = data[1];
    _myFanMembers.value = data[2];
    print("${data[0].length} ${data[1].length} ${data[2].length}");
  }

  void myFanDetailList() {
    Get.to(() => const MainFavoriteMeScreen());
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
