import 'package:dating/data/model/main_response.dart';
import 'package:dating/data/model/user.dart';
import 'package:dating/data/repository/user_repository.dart';
import 'package:dating/utils/status_enum.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final Rxn<MainResponse> _users = Rxn<MainResponse>();
  final Rx<Status> _status = Rx<Status>(Status.loading);
  final UserRepository userRepository;
  final Rxn<User> _myInfo = Rxn<User>();
  static UserController get to => Get.find();

  UserController({required this.userRepository});

  MainResponse? get users => _users.value;
  User? get myInfo => _myInfo.value;

  bool get isLoading => (_status.value.name == "loading") ? true : false;

  @override
  void onInit() {
    super.onInit();
    fetchData();
    searchMyInfo();
  }

  Future<void> fetchData() async {
    /// 사용자가 로그인하지 않은 경우
    /// 예외처리
    if (await const FlutterSecureStorage().read(key: "accessToken") == null) {
      return;
    }
    _status(Status.loading);
    await userRepository.getUserData().then((data) {
      if (data == null) {
        _status(Status.error);
      } else {
        _users.value = data;
        _status(Status.loaded);
      }
    }).onError((error, stackTrace) {
      _status(Status.error);
      print(error);
      print(stackTrace);
    });
  }

  void searchMyInfo() async {
    /// 사용자가 로그인하지 않은경우 예외처리
    if (await const FlutterSecureStorage().read(key: "token") == null) return;
    userRepository.searchMyInfo().then((data) {
      _myInfo.value = data;
    });
  }
}
