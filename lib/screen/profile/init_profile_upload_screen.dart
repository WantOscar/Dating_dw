import 'package:dating/controller/init_profile_upload_screen_controller.dart';
import 'package:dating/data/model/album.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

/// 최초 로그인한 사용자가 프로필을 등록하기 위하여
/// 가장 최초로 사용하게 되는 업로드 화면
/// 최초로 사진을 업로드 하게 되면
/// 이 화면을 더이상 사용하지 않음.
class InitProfileUploadScreen
    extends GetView<InitProfileUploadScreenController> {
  const InitProfileUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: Get.back,
          child: const Icon(
            Icons.close,
            size: 25,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
              childAspectRatio: 1.0),
          itemCount: controller.albums.length,
          itemBuilder: (context, index) {
            final AssetEntity image =
                controller.albums[controller.albumIndex].images![index];
            return Container(
              child: AssetEntityImage(image),
            );
          }),
    );
  }
}
