import 'package:dating/data/model/user.dart';
import 'package:dating/data/repository/home_repository.dart';

class HomeService {
  final HomeRepository homeRepository;

  HomeService({
    required this.homeRepository,
  });

  Future<List<List<User>>> getHomeDatas() async {
    final response = await homeRepository.getHomeDatas();
    List randomMemberList = response["randomMemberList"];
    List sendHeartList = response["sendHeartList"];
    List receiverHeartList = response["receiverHeartList"];
    return [
      randomMemberList.map((json) => User.fromJson(json)).toList(),
      sendHeartList.map((json) => User.fromJson(json)).toList(),
      receiverHeartList.map((json) => User.fromJson(json)).toList()
    ];
  }
}
