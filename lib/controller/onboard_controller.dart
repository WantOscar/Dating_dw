import 'dart:io';

import 'package:dating/binding/home_binding.dart';
import 'package:dating/controller/user_controller.dart';
import 'package:dating/data/model/user.dart';
import 'package:dating/data/provider/user_fetch.dart';
import 'package:dating/screen/home_screen.dart';
import 'package:dating/utils/enums.dart';
import 'package:dating/utils/toast_message.dart';
import 'package:dating/widget/profile/item_select_bottom_sheet.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:remedi_kopo/remedi_kopo.dart';
import 'package:uuid/uuid.dart';

class OnboardingController extends GetxController with ToastMessage {
  final UserFetch userService;
  static OnboardingController get to => Get.find();
  OnboardingController({required this.userService});
  final Rx<List<List<File?>>> _selectProfileImages = Rx<List<List<File?>>>(
      List.generate(2, (index) => List.generate(3, (index) => null)));

  final RxBool _isLoading = true.obs;

  bool get isLoading => _isLoading.value;

  final Rxn<Gender> _gender = Rxn<Gender>();

  /// 생년 인덱스
  final List<String> _yearsList =
      List.generate(DateTime.now().year - 1900, (index) => "${index + 1901}년");
  int _yearIndex = 0;

  /// 월 인덱스
  late List<String> _monthList;
  int _monthIndex = 0;

  late List<String> _dayList;
  int _dayIndex = 0;

  /// 사용자의 생년월일 정보를 담는
  /// 옵저블 변수
  RxInt _year = 0.obs;
  RxInt _month = 0.obs;
  RxInt _day = 0.obs;

  /// 선택한 생년월일 옵저블 변수
  int get year => _year.value;
  int get month => _month.value;
  int get day => _day.value;

  final RxString _height = "".obs;
  String get height => _height.value;

  /// 사용자의 신장크기 인덱스
  int _heightIndex = 0;

  /// 사용자의 거주 주소
  final RxString _address = "".obs;
  String get address => _address.value;

  /// 텍스트 컨트롤러
  final TextEditingController _nickName = TextEditingController();
  TextEditingController get nickName => _nickName;
  final TextEditingController _description = TextEditingController();
  TextEditingController get description => _description;
  late bool? isFirstLogin;
  final int selectProfileImagesLength = 0;
  Gender? get gender => _gender.value;

  List<List<File?>> get selectProfileImage => _selectProfileImages.value;

  set selectProfileImage(List<List<File?>> images) {
    _selectProfileImages.value = images;
  }

  @override
  void onInit() {
    _getUserData();
    super.onInit();
  }

  _initBirthDay() {
    _year.value = 0;
    _month.value = 0;
    _day.value = 0;
  }

  /// 사용자의 프로필 정보가 이미 등록되어 있는지
  /// 확인하는 메소드
  /// 사용자 정보가 있다면 바로 홈 페이지로 라이팅함.
  void _getUserData() async {
    await Future.delayed(const Duration(seconds: 3));
    final memberInfo = await userService.searchMyInfo();
    if (memberInfo != null) {
      Get.off(() => const HomeScreen(), binding: HomeBinding());
      UserController.to.setMyInfo(memberInfo);
    } else {
      _isLoading(false);
    }
  }

  /// 성별을 남자로 설정하는 함수
  /// 이미 설정되어 있으면 다시 초기화함.
  void setGenderToMan() {
    if (_gender.value == Gender.man) {
      _gender.value = null;
    } else {
      _gender.value = Gender.man;
    }
    _gender.refresh();
  }

  /// 성별을 여자로 설정하는 함수
  /// 이미 설정되어 있으면 다시 초기화함.
  void setGenderToWoman() {
    if (_gender.value == Gender.woman) {
      _gender.value = null;
    } else {
      _gender.value = Gender.woman;
    }
    _gender.refresh();
  }

  /// 생년월일 중 연도를 고르는 함수
  void pickBirthdayYear() {
    Get.bottomSheet(ItemSelectBottomSheet(
      items: _yearsList,
      onSelectedItemChanged: (value) {
        _yearIndex = value;
      },
      onDone: () {
        if (_year.value != "" || _month.value != "" || _day.value != "") {
          _initBirthDay();
        }
        _year(_yearIndex + 1901);

        _monthList = List.generate(12, (index) => "${index + 1}월");
        Get.back();
      },
    ));
  }

  /// 생년월일 중 월을 고르는 함수
  void pickBirthdayMonth() {
    if (_year.value == "") {
      return;
    }

    Get.bottomSheet(ItemSelectBottomSheet(
      items: _monthList,
      onSelectedItemChanged: (value) {
        _monthIndex = value;
      },
      onDone: () {
        _month(_monthIndex + 1);

        /// 월별 마지막 일수 계산 후 배열 초기화
        _dayList = List.generate(
            DateTime(_yearIndex + 1901, _monthIndex + 2, 0).day,
            (index) => "${index + 1}일");
        Get.back();
      },
    ));
  }

  /// 생년월일 중 일을 고르는 함수
  void pickBirthdayDay() {
    if (_month.value == "" || _year.value == "") {
      return;
    }

    Get.bottomSheet(ItemSelectBottomSheet(
      items: _dayList,
      onSelectedItemChanged: (value) {
        _dayIndex = value;
      },
      onDone: () {
        _day(_dayIndex + 1);

        Get.back();
      },
    ));
  }

  /// 사용자의 키를 설정하는 함수
  void pickMyHeight() {
    Get.bottomSheet(ItemSelectBottomSheet(
      items: List.generate(100, (index) => "${index + 150}cm"),
      onSelectedItemChanged: (value) {
        _heightIndex = value;
      },
      onDone: () {
        _height((_heightIndex + 150).toString());
        Get.back();
      },
    ));
  }

  /// 사용자 주소지 검색 api 함수
  void searchMyAddress() async {
    if (_address.value.isEmpty) {
      _address.value = "";
      return;
    }

    KopoModel? result = await Get.to(() => RemediKopo());
    if (result != null) {
      _address(result.address
          .toString()
          .split(" ")
          .getRange(0, 3)
          .toList()
          .join(" "));
    }
  }

  /// 임시 홈화면 라우팅 메소드
  /// 계정 등록 기능이 완성되면
  /// 삭제될 예정
  void goToHome() => Get.off(() => HomeScreen(), binding: HomeBinding());

  /// 사용자 정보 등록 메소드
  /// 사용자가 정보 등록을 시도하고 완료하면 홈 페이지로 라우팅됨.
  void updateUserInfo() async {
    /// 회원 정보 갱신 로직

    const uuid = Uuid();
    List<dio.MultipartFile> images = [];
    for (List<File?> rows in _selectProfileImages.value) {
      for (File? image in rows) {
        if (image != null) {
          images.add(dio.MultipartFile.fromFileSync(image.path,
              filename: "${uuid.v1()}.jpeg"));
        }
      }
    }

    if (images.length <= 3) {
      showToast("최소 3개 이상 프로필을 등록해주세요!");
      return;
    }

    dio.FormData data = dio.FormData.fromMap({"file": images});

    // final data = dio.FormData.fromMap({"file": multiPartFiles});
    print(data.files);
    final urls = await userService.uploadImage(data);
    if (urls.isNotEmpty) {
      NumberFormat format = NumberFormat("00");
      User user = User(
          nickName: _nickName.text.toString().trim(),
          description: _description.text.toString(),
          birthDay:
              "${_year.value}-${format.format(_month.value)}-${format.format(_day.value)}",
          address: _address.value,
          gender: _gender.value!.name,
          age: DateTime.now().year - int.parse(_year.value.toString()) + 1,
          height: int.parse(_height.value.toString()),
          images: urls,
          image: urls.first);

      final data = user.toJson();
      final response = userService.updateUserInfo(data);

      Get.off(() => const HomeScreen(), binding: HomeBinding());
    }
  }
}
