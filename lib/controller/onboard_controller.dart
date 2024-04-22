import 'package:dating/screen/home_screen.dart';
import 'package:dating/widget/profile/item_select_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remedi_kopo/remedi_kopo.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Gender { MAN, WOMAN }

class OnboardingController extends GetxController {
  static OnboardingController get to => Get.find();
  final Rx<List<List<String?>>> _selectProfileImages = Rx<List<List<String?>>>(
      List.generate(2, (index) => List.generate(3, (index) => null)));

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
  final RxString _year = "".obs;
  final RxString _month = "".obs;
  final RxString _day = "".obs;

  /// 선택한 생년월일 옵저블 변수
  String get year => _year.value;
  String get month => _month.value;
  String get day => _day.value;

  final RxString _height = "".obs;
  String get height => _height.value;

  /// 사용자의 신장크기 인덱스
  int _heightIndex = 0;

  /// 사용자의 거주 주소
  final Rxn<KopoModel> _address = Rxn<KopoModel>();
  KopoModel? get address => _address.value;

  /// 텍스트 컨트롤러
  final TextEditingController _nickName = TextEditingController();
  TextEditingController get nickName => _nickName;
  final TextEditingController _description = TextEditingController();
  TextEditingController get description => _description;
  late bool? isFirstLogin;
  final int selectProfileImagesLength = 0;
  Gender? get gender => _gender.value;

  List<List<String?>> get selectProfileImage => _selectProfileImages.value;

  set selectProfileImage(List<List<String?>> images) {
    _selectProfileImages.value = images;
  }

  @override
  void onInit() {
    _getFirstLogin();
    super.onInit();
  }

  _initBirthDay() {
    _year.value = "";
    _month.value = "";
    _day.value = "";
  }

  /// 최초 로그인인지 확인하는 함수
  void _getFirstLogin() async {
    final prefs = await SharedPreferences.getInstance();
    isFirstLogin = prefs.getBool("isFirstLogin");
    if (isFirstLogin != null) {
      Get.offAll(() => const HomeScreen());
    } else {}
  }

  /// 성별을 남자로 설정하는 함수
  /// 이미 설정되어 있으면 다시 초기화함.
  void setGenderToMan() {
    if (_gender.value == Gender.MAN) {
      _gender.value = null;
    } else {
      _gender.value = Gender.MAN;
    }
    _gender.refresh();
  }

  /// 성별을 여자로 설정하는 함수
  /// 이미 설정되어 있으면 다시 초기화함.
  void setGenderToWoman() {
    if (_gender.value == Gender.WOMAN) {
      _gender.value = null;
    } else {
      _gender.value = Gender.WOMAN;
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
        _year(_yearsList[_yearIndex]);

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
        _month(_monthList[_monthIndex]);

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
        _day(_dayList[_dayIndex]);

        Get.back();
      },
    ));
  }

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
    if (_address.value != null) {
      _address.value = null;
      return;
    }

    KopoModel? address = await Get.to(() => RemediKopo());
    if (address != null) {
      _address(address);
    }
  }
}
