import 'dart:io';

import 'package:dating/controller/onboard_controller.dart';
import 'package:dating/data/model/album.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:photo_manager/photo_manager.dart';

class InitProfileUploadScreenController extends GetxController {
  static InitProfileUploadScreenController get to => Get.find();
  final Rx<List<Album>> _albums = Rx<List<Album>>([]);
  final RxInt _albumIndex = 0.obs;
  final RxBool _isReady = false.obs;
  final Rx<List<CroppedFile>> _selectImages = Rx<List<CroppedFile>>([]);
  final Rx<List<int>> _selectImagesIndex = Rx<List<int>>([]);

  List<Album> get albums => _albums.value;
  int get albumIndex => _albumIndex.value;
  bool get isReady => _isReady.value;

  List<int> get selectImageIndex => _selectImagesIndex.value;

  @override
  void onReady() {
    _checkPermission();
    super.onReady();
  }

  void _checkPermission() async {
    final ps = await PhotoManager.requestPermissionExtend();
    if (ps == PermissionState.authorized) {
      _getAlbums();
    } else {
      PhotoManager.openSetting();
    }
  }

  void _getAlbums() async {
    final assets = await PhotoManager.getAssetPathList(type: RequestType.image);
    if (assets.isNotEmpty) {
      final List<Album> albums = [];
      for (AssetPathEntity _asset in assets) {
        final assetEntities =
            await _asset.getAssetListRange(start: 0, end: 10000);

        final Album album =
            Album.fromGallery(_asset.name, _asset.id, assetEntities);
        albums.add(album);
      }

      _albums.value = albums;
      _albums.refresh();
    }
    _isReady(true);
  }

  void changeIndex(int index) {
    _selectImagesIndex.value.clear();
    _selectImages.value.clear();
    _albumIndex(index);
    Get.back();
  }

  void selectImage(AssetEntity image, int index) async {
    if (_selectImagesIndex.value.contains(index)) {
      print("이미 선택한 이미지");
      final deleteIndex = _selectImagesIndex.value.indexOf(index);
      _selectImagesIndex.value.removeAt(deleteIndex);
      _selectImages.value.removeAt(deleteIndex);
      _selectImagesIndex.refresh();
      _selectImages.refresh();
      return;
    }
    final cropFile = await _cropImage(image);
    if (cropFile != null) {
      _selectImages.value.add(cropFile);
      _selectImagesIndex.value.add(index);
      _selectImages.refresh();
      _selectImagesIndex.refresh();
      print(_selectImagesIndex);
    }
  }

  Future<CroppedFile?> _cropImage(AssetEntity image) async {
    final File? file = await image.file;

    /// 선택한 이미지가 존재한다면
    /// 이미지 편집기를 실행시킴.
    if (file != null) {
      print(file.path);
      final cropImage = await ImageCropper().cropImage(
        sourcePath: file.path,
        compressFormat: ImageCompressFormat.png,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 100, // 저장할 이미지의 퀄리티
        uiSettings: [
          // 안드로이드 UI 설정
          AndroidUiSettings(
              toolbarTitle: '이미지 자르기/회전하기', // 타이틀바 제목
              toolbarColor: Colors.black, // 타이틀바 배경색
              toolbarWidgetColor: Colors.white, // 타이틀바 단추색

              initAspectRatio:
                  CropAspectRatioPreset.original, // 이미지 크로퍼 시작 시 원하는 가로 세로 비율
              lockAspectRatio: true), // 고정 값으로 자르기 (기본값 : 사용안함)
          // iOS UI 설정
          IOSUiSettings(
              title: '이미지 자르기/회전하기', // 보기 컨트롤러의 맨 위에 나타나는 제목
              aspectRatioLockEnabled: true,
              aspectRatioPickerButtonHidden: true,
              resetButtonHidden: true,
              doneButtonTitle: "완료",
              cancelButtonTitle: "취소"),
          // Web UI 설정
        ],
      );

      if (cropImage != null) {
        return cropImage;
      } else {
        return null;
      }
    }
    return null;
  }

  void completeSelectProfileImage() {
    /// 선택한 이미지가 없으면
    /// 이미지 선택을 완료할 수 없음.
    if (_selectImages.value.isEmpty) {
      return;
    }
    final List<List<File?>> selectProfileImages = [
      [null, null, null],
      [null, null, null]
    ];
    for (var i = 0; i < selectProfileImages.length; i++) {
      for (var j = 0; j < selectProfileImages[i].length; j++) {
        if (_selectImages.value.isEmpty) {
          break;
        }

        /// 선택한 이미지가 이미 선택되었다면
        /// 추가하지 않음.
        final path = _selectImages.value[0].path;
        selectProfileImages[i][j] = File(path);
        _selectImages.value.removeAt(0);
      }
    }
    OnboardingController.to.selectProfileImage = selectProfileImages;
    Get.back();
  }
}
