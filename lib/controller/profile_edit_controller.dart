import 'dart:io';

import 'package:dating/controller/user_controller.dart';
import 'package:dating/data/model/user.dart';
import 'package:dating/data/repository/user_repository.dart';
import 'package:dating/widget/common/notification_window.dart';
import 'package:dating/widget/common/warning_window.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
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

  String get address => _address.value;

  // List<dynamic> get images => List.generate(6, (index) => null);

  List<dynamic> get images {
    List<dynamic> images = List.generate(6, (_) => null);
    for (var i = 0; i < _user.value!.images!.length; i++) {
      images[i] = _user.value!.images![i];
    }
    return images;
  }

  final TextEditingController _descriptionController = TextEditingController();

  TextEditingController get descriptionController => _descriptionController;

  String _description = "";

  String get desciption => _description;

  /// 뒤로 이동하는 함수
  void back() {
    Get.dialog(NotificationWindow(
      title: '프로필 수정 취소',
      content: '현재 변경사항을 모두 취소하고 돌아가시겠습니까?',
      onConfirm: () {
        Get.until((route) => Get.currentRoute == "/HomeScreen");
      },
      confirmLabel: "수정취소",
      onCancel: Get.back,
      cancelLabel: "취소",
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
        uploadImages.add(MultipartFile.fromFileSync(image.path,
            filename: "${uuid.v1()}.jpeg"));
      } else {
        imageUrls.add(image);
      }
    }
    if (uploadImages.isNotEmpty) {
      FormData data = FormData.fromMap({"file": uploadImages});

      final newImageUrls = await userRepository.uploadImage(data);
      imageUrls.addAll(newImageUrls);
    }
    if (user != null) {
      final newUser = User(
        id: user?.id,
        nickName: user?.nickName,
        description: (_description.isEmpty) ? user?.description : _description,
        birthDay: user?.birthDay,
        address: (_address.value.isEmpty) ? user?.address : _address.value,
        gender: user?.gender,
        age: user?.age,
        height: user?.height,
        images: imageUrls,
        image: imageUrls.first,
        personalInfo: user?.personalInfo,
        personality: user?.personality,
        likePersonality: user?.likePersonality,
      );
      final result = await userRepository.updateUserInfo(newUser);
      UserController.to.updateUserInfo(result);
      Get.back();
    }
  }

  void changeDescription(String value) {
    _description = value;
  }
}
