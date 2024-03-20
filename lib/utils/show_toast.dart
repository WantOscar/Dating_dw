import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

mixin UseToast {
  void showToast(String msg, {ToastGravity gravity = ToastGravity.TOP}) {
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Colors.white,
      gravity: gravity,
      fontSize: 17,
      textColor: Colors.black,
      toastLength: Toast.LENGTH_SHORT, // 토스트 뜨는 시간(android)
      timeInSecForIosWeb: 1, // 토스트 뜨는 시간(IOS & Web)
    );
  }
}
