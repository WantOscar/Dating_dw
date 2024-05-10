import 'dart:io';

import 'package:get/get.dart';
import 'package:remedi_kopo/remedi_kopo.dart';

class ProfileEditController extends GetxController {
  final Rx<List<File?>> _files = Rx<List<File?>>([
    null,
    null,
    null,
    null,
    null,
    null,
  ]);
  final List<List<int>> _imageIndex = [
    [0, 1, 2],
    [3, 4, 5],
  ];

  final Rxn<KopoModel> _address = Rxn<KopoModel>();

  List<File?> get files => _files.value;

  List<List<int>> get imageIndex => _imageIndex;

  void searchAddress() {
    Get.to(() => RemediKopo());
  }
}
