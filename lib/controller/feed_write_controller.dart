import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedWriteController extends GetxController {
  final _textController1 = TextEditingController();
  final _textController2 = TextEditingController();

  TextEditingController get textController1 => _textController1;
  TextEditingController get textController2 => _textController2;
}
