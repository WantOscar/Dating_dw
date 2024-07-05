import 'package:dating/data/model/my_fan_member.dart';
import 'package:dating/data/model/my_favorite_member.dart';
import 'package:dating/data/model/recommend_member.dart';
import 'package:dating/data/service/home_service.dart';
import 'package:dating/screen/main/main_favorite_me_screen.dart';
import 'package:dating/screen/profile/someone_profile_screen.dart';
import 'package:dating/utils/show_toast.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class MainController extends GetxController with UseToast {
  final HomeService homeService;
  final Rx<List<RecommendMember>> _recommendMembers =
      Rx<List<RecommendMember>>([]);
  final Rx<List<MyFavoriteMember>> _myFavoriteMembers =
      Rx<List<MyFavoriteMember>>([]);
  final Rx<List<MyFanMember>> _myFanMembers = Rx<List<MyFanMember>>([]);

  List<RecommendMember> get recommendMembers => _recommendMembers.value;
  List<MyFavoriteMember> get myFavoriteMember => _myFavoriteMembers.value;
  List<MyFanMember> get myFanMembers => _myFanMembers.value;

  MainController({required this.homeService});

  @override
  void onInit() {
    super.onInit();
    _fetchData();
  }

  void _fetchData() async {
    final data = await homeService.getHomeDatas();

    _recommendMembers.value = List<RecommendMember>.from(data[0]);
    _myFavoriteMembers.value = List<MyFavoriteMember>.from(data[1]);
    _myFanMembers.value = List<MyFanMember>.from(data[2]);
  }

  void myFanDetailList() {
    Get.to(() => const MainFavoriteMeScreen());
  }

  void otherProfile() {
    Get.to(() => const SomeoneProfileScreen());
  }

  void requestChatAlarm() {
    showToast('채팅을 신청하였습니다!', gravity: ToastGravity.CENTER);
  }
}
