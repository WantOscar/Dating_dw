import 'package:dating/data/model/main_response.dart';
import 'package:dating/data/model/user.dart';
import 'package:dating/data/provider/user_fetch.dart';

class UserRepository {
  UserFetch service;
  UserRepository({required this.service});

  Future<MainResponse?> getUserData() => service.fetchUserData();

  Future<User?> searchMyInfo() => service.searchMyInfo();
}
