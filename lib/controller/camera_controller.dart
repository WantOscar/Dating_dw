import 'package:camera/camera.dart';
import 'package:dating/controller/profile_image_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class CameraScreenController extends GetxController {
  late CameraController _controller;
  late Rx<Future<void>> _initializedCameraController;
  final RxDouble _currentZoomLevel = 1.0.obs;
  final RxDouble _minZoomLevel = 1.0.obs;
  final RxDouble _maxZoomLevel = 1.0.obs;
  final RxBool _isLoaded = false.obs;

  int cameraMode = 0;

  CameraController get controller => _controller;
  double get currentZoomLevel => _currentZoomLevel.value;
  double get minZoomLevel => _minZoomLevel.value;
  double get maxZoomLevel => _maxZoomLevel.value;

  bool get isLoaded => _isLoaded.value;

  @override
  void onReady() {
    _initCamera();
    super.onReady();
  }

  void _initCamera() async {
    final cameras = await availableCameras();

    /// 카메라 앱이 존재하지 않는 경우
    /// 사용자는 카메라 기능을 사용할 수 없기 때문에
    /// 다시 이전 화면으로 라우팅됨.
    if (cameras.isEmpty) {
      Get.snackbar("카메라앱 에러", "사용 가능한 카메라앱이 존재하지 않습니다!");
      Get.back();
      return;
    }

    /// 가장 기본적으로 첫번째 후면 렌즈를 사용함.
    final camera = cameras[0];
    _controller = CameraController(camera, ResolutionPreset.veryHigh,
        imageFormatGroup: ImageFormatGroup.jpeg);

    /// 초기화가 완료되면 카메라가 기본적으로 제공하는
    /// 줌 레벨을 각각 할당받아옴.
    await _controller.initialize().then((_) async {
      _minZoomLevel.value = await _controller.getMinZoomLevel();

      _maxZoomLevel.value = await _controller.getMaxZoomLevel();
      print(_minZoomLevel.value);
      print(_maxZoomLevel.value);
    });

    _isLoaded(true);
    print(_isLoaded.value);
  }

  /// 카메라 확대 및 축소 메소드
  void changeZoomLevel(double value) async {
    _currentZoomLevel(value);
    await _controller.setZoomLevel(value);
  }

  /// 카메라 전면 후면 변경 메소드
  void changeToCameraFowardOrBackward() {
    if (cameraMode == 0) {}
  }

  /// 사진 촬영 메소드
  void takePicture() async {
    if (!_controller.value.isInitialized) {
      return;
    }

    try {
      await _controller.initialize();
      XFile picture = await _controller.takePicture();
      print(picture.path);
      cropImage(picture);
    } on Exception catch (error) {
      print("hello");
      print(error);
    }
  }

  void cropImage(XFile file) async {
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
      await ImageGallerySaver.saveFile(cropImage.path);
      ProfileImageController.to.getAlbums();
      Get.back();
    }
  }
}
