import 'package:dating/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Gender { MAN, WOMAN }

class OnboardingController extends GetxController {
  static OnboardingController get to => Get.find();
  final Rx<List<List<String?>>> _selectProfileImages = Rx<List<List<String?>>>(
      List.generate(2, (index) => List.generate(3, (index) => null)));

  final Rxn<Gender> _gender = Rxn<Gender>();

  final TextEditingController _nickName = TextEditingController();

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

  void _getFirstLogin() async {
    final prefs = await SharedPreferences.getInstance();
    isFirstLogin = prefs.getBool("isFirstLogin");
    if (isFirstLogin != null) {
      Get.offAll(() => const HomeScreen());
    } else {}
  }

  void setGenderToMan() {
    if (_gender.value == Gender.MAN) {
      _gender.value = null;
    } else {
      _gender.value = Gender.MAN;
    }
    _gender.refresh();
  }

  void setGenderToWoman() {
    if (_gender.value == Gender.WOMAN) {
      _gender.value = null;
    } else {
      _gender.value = Gender.WOMAN;
    }
    _gender.refresh();
  }
}
