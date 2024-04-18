import 'dart:io';

import 'package:dating/data/model/album.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:photo_manager/photo_manager.dart';

class ProfileImageController extends GetxController {
  final Rx<List<AlbumModel>> _albums = Rx<List<AlbumModel>>([]);
  final Rxn<CroppedFile> _image = Rxn<CroppedFile>();

  List<AlbumModel> get album => _albums.value;

  final RxInt _index = 0.obs;

  int get idx => _index.value;
  CroppedFile? get image => _image.value;

  @override
  void onReady() {
    _checkPermission();
    super.onReady();
  }

  /// 앨범 변경 메소드
  void changeIndex(int index) {
    _index(index);
    Get.back();
  }

  /// 갤러리 접근 권환 확인
  void _checkPermission() async {
    final ps = await PhotoManager.requestPermissionExtend(
        requestOption: const PermissionRequestOption(
            androidPermission: AndroidPermission(
                type: RequestType.image, mediaLocation: true)));
    if (ps.isAuth) {
      getAlbums();
    } else {
      PhotoManager.openSetting();
    }
  }

  /// 갤러리 이미지를 가져오는 메소드
  Future<void> getAlbums() async {
    await PhotoManager.getAssetPathList(type: RequestType.image).then((paths) {
      for (AssetPathEntity asset in paths) {
        asset.getAssetListRange(start: 0, end: 10000).then((images) {
          if (images.isNotEmpty) {
            final album = AlbumModel.fromGallery(
              asset.name,
              asset.id,
              images,
            );
            print(album);
            _albums.value.add(album);
            _albums.refresh();
          }
        });
      }
    });
  }

  void changeImage(AssetEntity image) {
    if (_image.value != null) {
      clearImage();
    } else {
      print(image);

      _cropImage(image);
    }
  }

  void _cropImage(AssetEntity image) async {
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

      /// 이미지 편집을 완료하면
      /// 예상 이미지에 해당 이미지 파일을 전달함.
      if (cropImage != null) {
        _image(cropImage);
      }
    }
  }

  void clearImage() {
    _image.value = null;
  }
}
