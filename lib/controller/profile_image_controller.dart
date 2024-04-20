import 'dart:io';
import 'package:dating/controller/camera_controller.dart';
import 'package:dating/controller/upload_controller.dart';
import 'package:dating/data/model/album.dart';
import 'package:dating/screen/profile/profile_edit_screen.dart';
import 'package:dating/widget/profile/warning_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:photo_manager/photo_manager.dart';

import '../screen/profile/camera_screen.dart';

class ProfileImageController extends GetxController {
  final Rx<List<AlbumModel>> _albums = Rx<List<AlbumModel>>([]);
  final Rxn<CroppedFile> _selectImage = Rxn<CroppedFile>();
  final RxBool _isReady = false.obs;
  final RxnInt _selectImageIndex = RxnInt();

  static ProfileImageController get to => Get.find();

  bool get isReady => _isReady.value;

  List<AlbumModel> get album => _albums.value;

  final RxInt _albumIndex = 0.obs;

  int get idx => _albumIndex.value;
  int? get selectImageIndex => _selectImageIndex.value;
  CroppedFile? get image => _selectImage.value;

  @override
  void onReady() {
    _checkPermission();
    super.onReady();
  }

  /// 앨범 변경 메소드
  void changeIndex(int index) {
    _albumIndex(index);
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
    if (_albums.value.isNotEmpty) {
      _albums.value.clear();
    }

    PhotoManager.getAssetPathList(type: RequestType.image).then((paths) {
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
      print(_albums.value);
    });
    _isReady(true);
  }

  /// 이미지를 변경하는 메소드
  void changeImage(AssetEntity image, int index) {
    /// 동일한 사진을 선택하면 아무런 효과도 일어나지 않음.
    if (_selectImageIndex.value == index) {
      return;
    }

    if (_selectImageIndex.value != null && _selectImage.value != index) {
      Get.dialog(WarningWindow(
        onTap: () {
          Get.back();
          _cropImage(image, index);
        },
        titleText: "선택한 사진 변경",
        explainText: "이미 선택한 사진이 존재합니다. 해당 사진을 지우고 다른 이미지를 선택하겠습니까?",
        btnText: "사진 변경",
      ));

      return;
    }

    _cropImage(image, index);
  }

  void _cropImage(AssetEntity image, int index) async {
    try {
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
          _selectImage(cropImage);
          _selectImageIndex(index);
        }
      }
    } on PlatformException catch (error) {
      switch (error.code) {
        case "crop_error":
          PhotoManager.openSetting();
          break;
        default:
      }
    }
  }

  void clearSelectImage() {
    Get.dialog(WarningWindow(
        onTap: () {
          _selectImage.value = null;
          _selectImageIndex.value = null;
          Get.back();
        },
        titleText: "사진 삭제",
        explainText: "이미 편집이 완료된 사진을 취소하시겠습니까?",
        btnText: "삭제하기"));
  }

  void backToPreviousPage() {
    if (_selectImage.value != null) {
      Get.dialog(WarningWindow(
          onTap: () {
            Get.off(() => const ProfileEditScreen());
            Get.delete<ProfileImageController>();
          },
          titleText: "업로드 취소",
          explainText: "이미 편집된 사진이 존재합니다. 모든 작업을 종료하고 돌아갈까요?",
          btnText: "돌아가기"));
      return;
    }

    Get.back();
  }

  /// 카메라 화면으로 이동하는 메소드
  void moveToCameraScreen() {
    Get.to(() => const CameraScreen(), binding: BindingsBuilder(() {
      Get.put(CameraScreenController());
    }));
  }
}
