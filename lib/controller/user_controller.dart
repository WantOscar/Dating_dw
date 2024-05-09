import 'package:dating/data/model/user.dart';
import 'package:dating/data/repository/user_repository.dart';
import 'package:dating/utils/enums.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final Rxn<List<User>> _users = Rxn<List<User>>([]);
  final Rx<Status> _status = Rx<Status>(Status.loading);
  final UserRepository userRepository;
  final Rxn<User> _myInfo = Rxn<User>();
  static UserController get to => Get.find();

  UserController({required this.userRepository});

  List<User>? get users => _users.value;
  User? get myInfo => _myInfo.value;

  void setMyInfo(User user) {
    _myInfo(user);
    _myInfo.refresh();
  }

  bool get isLoading => (_status.value.name == "loading") ? true : false;
}
