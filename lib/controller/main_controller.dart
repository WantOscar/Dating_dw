import 'package:dating/data/model/my_fan_member.dart';
import 'package:dating/data/model/my_favorite_member.dart';
import 'package:dating/data/model/recommend_member.dart';
import 'package:dating/data/service/home_service.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final HomeService homeService;
  final Rx<List<RecommendMember>> _recommendMembers =
      Rx<List<RecommendMember>>([]);
  final Rx<List<MyFavoriteMember>> _myFavoriteMembers =
      Rx<List<MyFavoriteMember>>([]);
  final Rx<List<MyFanMember>> _myFanMembers = Rx<List<MyFanMember>>([]);

  MainController({required this.homeService});

  @override
  void onInit() {
    super.onInit();
    _fetchData();
  }

  void _fetchData() async {
    final data = await homeService.getHomeDatas();

    _recommendMembers.value = data[0] as List<RecommendMember>;
    _myFavoriteMembers.value = data[1] as List<MyFavoriteMember>;
    _myFanMembers.value = data[2] as List<MyFanMember>;
  }
}
