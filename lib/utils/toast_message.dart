import 'package:fluttertoast/fluttertoast.dart';

mixin ToastMessage {
  static void showToast(String message) {
    Fluttertoast.showToast(toastLength: Toast.LENGTH_SHORT, msg: message);
  }
}
