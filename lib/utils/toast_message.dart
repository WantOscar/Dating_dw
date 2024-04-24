import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

mixin ToastMessage {
  static void showToast(String message) {
    Fluttertoast.showToast(
        backgroundColor: Colors.white,
        textColor: Colors.black87,
        toastLength: Toast.LENGTH_SHORT,
        msg: message,
        gravity: ToastGravity.CENTER);
  }
}
