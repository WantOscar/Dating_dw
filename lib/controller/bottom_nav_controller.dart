import 'package:get/get.dart';

class BottomNavController extends GetxController {
  final RxInt _index = 0.obs;

  int get index => _index.value;

  void changeIndex(int value) {
    _index(value);
  }
}
