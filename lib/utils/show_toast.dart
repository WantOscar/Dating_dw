import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

mixin UseToast {
  void showToast(String msg, {ToastGravity gravity = ToastGravity.TOP}) {
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Get.theme.colorScheme.tertiary,
      gravity: gravity,
      fontSize: 17,
      textColor: Get.theme.colorScheme.onSecondary,
      toastLength: Toast.LENGTH_SHORT, // 토스트 뜨는 시간(android)
      timeInSecForIosWeb: 1, // 토스트 뜨는 시간(IOS & Web)
    );
  }
}
