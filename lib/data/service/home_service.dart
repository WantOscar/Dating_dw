import 'package:dating/data/model/my_fan_member.dart';
import 'package:dating/data/model/my_favorite_member.dart';
import 'package:dating/data/model/recommend_member.dart';
import 'package:dating/data/repository/home_repository.dart';

class HomeService {
  final HomeRepository homeRepository;

  HomeService({
    required this.homeRepository,
  });

  Future<List<List<dynamic>>> getHomeDatas() async {
    final response = await homeRepository.getHomeDatas();
    List randomMemberList = response["randomMemberList"];
    List sendHeartList = response["sendHeartList"];
    List receiverHeartList = response["receiverHeartList"];
    return [
      randomMemberList.map((json) => RecommendMember.fromJson(json)).toList(),
      sendHeartList.map((json) => MyFavoriteMember.fromJson(json)).toList(),
      receiverHeartList.map((json) => MyFanMember.fromJson(json)).toList()
    ];
  }
}
