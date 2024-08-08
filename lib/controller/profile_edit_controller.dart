import 'dart:io';

import 'package:dating/controller/user_controller.dart';
import 'package:dating/data/model/user.dart';
import 'package:dating/data/service/user_fetch.dart';
import 'package:dating/screen/profile/profile_screen.dart';
import 'package:dating/widget/common/warning_window.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:remedi_kopo/remedi_kopo.dart';
import 'package:uuid/uuid.dart';

class ProfileEditController extends GetxController {
  static ProfileEditController get to => Get.find();
  final UserFetch userService;
  final Rx<User?> _user = UserController.to.myInfo.obs;
  final Rx<List<File?>> _files =
      Rx<List<File?>>(List.generate(6, (index) => null));
  final List<List<int>> _imageIndex = [
    [0, 1, 2],
    [3, 4, 5],
  ];
  ProfileEditController({
    required this.userService,
  });

  final RxString _address = "".obs;

  List<File?> get files => _files.value;

  /// 뒤로 이동하는 함수
  void back() {
    Get.dialog(WarningWindow(
      titleText: '프로필 수정 취소',
      explainText: '현재 변경사항을 모두 취소하고 돌아가시겠습니까?',
      onTap: () {
        Get.until((route) => Get.currentRoute == "/HomeScreen");
      },
      btnText: "수정취소",
    ));
  }

  /// 사용자 주소지 검색 api 함수
  void searchMyAddress() async {
    if (_address.value.isNotEmpty) {
      _address.value = "";
      return;
    }

    KopoModel? result = await Get.to(() => RemediKopo());
    if (result != null) {
      /// 주소지 중 상세 주소는 사용하지 않음.
      var myAddress = result.address.toString().split(" ");
      _address(myAddress.getRange(0, 3).toList().join(" "));
      _user.value!.address = _address.value;
      _user.refresh();
    }
  }

  List<List<int>> get imageIndex => _imageIndex;

  User? get user => _user.value;

  void addNewProfileImage(File image) {
    for (var i = 0; i < _files.value.length; i++) {
      if (_files.value[i] == null) {
        _files.value[i] = image;
        break;
      }
    }
    _files.refresh();
    print(_files.value);
  }

  void updateUserInfo() async {
    const Uuid uuid = Uuid();
    final images = [];
    var imageUrls = [];
    for (var file in _files.value) {
      if (file != null) {
        images.add(dio.MultipartFile.fromFileSync(file.path,
            filename: "${uuid.v1()}.jpeg"));
      }
    }
    if (images.isNotEmpty) {
      print(images);
      dio.FormData data = dio.FormData.fromMap({"file": images});
      print(data.files);
      imageUrls = await userService.uploadImage(data);
      print(imageUrls);
    }

    if (_user.value != null) {
      final User user = User(
          nickName: _user.value!.nickName,
          description: _user.value!.description,
          birthDay: _user.value!.birthDay,
          address: _user.value!.address,
          gender: _user.value!.gender,
          age: _user.value!.age,
          height: _user.value!.height,
          images: imageUrls,
          image: imageUrls.firstOrNull);
      print(user.toJson());
      final response = await userService.updateUserInfo(user.toJson());
      print(response);
    }
    Get.back();
  }
}
