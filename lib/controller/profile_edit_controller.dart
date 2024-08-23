import 'dart:io';

import 'package:dating/controller/user_controller.dart';
import 'package:dating/data/model/user.dart';
import 'package:dating/data/repository/user_repository.dart';
import 'package:dating/widget/common/warning_window.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:remedi_kopo/remedi_kopo.dart';
import 'package:uuid/uuid.dart';

class ProfileEditController extends GetxController {
  static ProfileEditController get to => Get.find();
  final UserRepository userRepository;
  final Rx<User?> _user = UserController.to.myInfo.obs;
  final List<File> _files = List<File>.empty(growable: true);
  final List<List<int>> _imageIndex = [
    [0, 1, 2],
    [3, 4, 5],
  ];
  ProfileEditController({
    required this.userRepository,
  });

  final RxString _address = "".obs;

  // List<dynamic> get images => List.generate(6, (index) => null);

  List<dynamic> get images {
    List<dynamic> images = List.generate(6, (_) => null);
    for (var i = 0; i < _user.value!.images!.length; i++) {
      images[i] = _user.value!.images![i];
    }
    return images;
  }

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
    _files.add(image);
    _user.value!.images!.add(image);
    _user.refresh();
  }

  void updateUserInfo() async {
    const Uuid uuid = Uuid();
    final uploadImages = [];
    List<String> imageUrls = [];
    for (var image in _user.value!.images!) {
      if (image is! String) {
        uploadImages.add(dio.MultipartFile.fromFileSync(image.path,
            filename: "${uuid.v1()}.jpeg"));
      } else {
        imageUrls.add(image);
      }
    }
    if (uploadImages.isNotEmpty) {
      print(images);
      dio.FormData data = dio.FormData.fromMap({"file": uploadImages});
      print(data.files);
      final newImageUrls = await userRepository.uploadImage(data);
      imageUrls.addAll(newImageUrls);
      print(imageUrls);
      _user.value!.images = imageUrls;
    }

    if (_user.value != null) {
      print(user!.toJson());
      final response = await userRepository.updateUserInfo(user!.toJson());
      print(response);
      Get.back();
    }
  }
}
