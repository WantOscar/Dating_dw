import 'package:dating/controller/camera_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CameraScreen extends GetView<CameraScreenController> {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          backgroundColor: Colors.black,
          body: (controller.isLoaded) ? _camera() : _loading()),
    );
  }

  Widget _loading() => Container(
        color: Colors.black,
      );

  Widget _camera() => Stack(
        children: [
          _preview(),
          _arrowBack(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _zoomLevel(),
                _zoomSlider(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _changeCamera(),
                      _takePhotoBtn(),
                      Opacity(
                        opacity: 0.0,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: Color(0xff4d4d4d),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.change_circle_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      );

  /// 카메라 렌즈 화면을 보여주는 프리뷰 영역
  Widget _preview() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 100.0),
        child: Center(child: controller.controller.buildPreview()),
      );

  /// 카메라 화면에서 뒤로 이동하는 좌측 상단 버튼
  Widget _arrowBack() => Padding(
        padding: const EdgeInsets.all(30.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: GestureDetector(
            onTap: Get.back,
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
      );

  /// 현재 카메라의 확대 수준을 보여주는 위젯
  Widget _zoomLevel() => Container(
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
            color: Colors.black54, borderRadius: BorderRadius.circular(4.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.close,
              color: Colors.white,
              size: 17,
            ),
            Text(
              controller.currentZoomLevel.toStringAsFixed(1),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      );

  /// 사용자가 카메라의 확대 수준을 조절하는 슬라이더 위젯
  Widget _zoomSlider() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 1.0),
        child: Slider(
            activeColor: Colors.white.withOpacity(0.8),
            inactiveColor: Colors.white.withOpacity(0.5),
            value: controller.currentZoomLevel,
            min: controller.minZoomLevel,
            max: controller.maxZoomLevel,
            onChanged: controller.changeZoomLevel),
      );

  /// 사용자가 카메라의 전면/후면 토글 할 수 있게 해주는 버튼
  Widget _changeCamera() => Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          color: Color(0xff4d4d4d),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.change_circle_outlined,
          color: Colors.white,
          size: 30,
        ),
      );

  /// 카메라 촬영 버튼
  Widget _takePhotoBtn() => GestureDetector(
        onTap: controller.takePicture,
        child: Container(
          padding: const EdgeInsets.all(2.0),
          width: 60,
          height: 60,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: Container(
            padding: const EdgeInsets.all(2.0),
            decoration: const BoxDecoration(
                color: Colors.black, shape: BoxShape.circle),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.camera,
                color: Colors.grey,
                size: 40,
              ),
            ),
          ),
        ),
      );
}
