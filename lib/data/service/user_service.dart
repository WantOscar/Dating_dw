import 'package:dating/data/model/user.dart';
import 'package:dating/data/repository/user_repository.dart';

class UserService {
  final UserRepository userRepository;
  UserService({required this.userRepository});

  Future<List<List<User>>> getHomeDatas() async {
    final response = await userRepository.getHomeDatas();
    List randomMemberList = response["randomMemberList"];
    List sendHeartList = response["favoriteMemberList"];
    List receiverHeartList = response["fanMemberList"];
    return [
      randomMemberList.map((json) => User.fromJson(json)).toList(),
      sendHeartList.map((json) => User.fromJson(json)).toList(),
      receiverHeartList.map((json) => User.fromJson(json)).toList()
    ];
  }

  Future<List<User>> newFavoriteMembers(int id) {
    return userRepository
        .newFavoriteMembers(id)
        .then((users) => users.map((json) => User.fromJson(json)).toList());
  }
}
