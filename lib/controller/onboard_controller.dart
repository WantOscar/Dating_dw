import 'package:dating/screen/auth/onboard_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingController extends GetxController {
  late bool? isFirstLogin;

  @override
  void onInit() {
    // _getFirstLogin();
    super.onInit();
  }

  void _getFirstLogin() async {
    final prefs = await SharedPreferences.getInstance();
    isFirstLogin = prefs.getBool("isFirstLogin");
    if (isFirstLogin == null) {
      Get.offAll(() => const OnboardScreen());
    }
  }
}
