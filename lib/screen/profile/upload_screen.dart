import 'dart:io';

import 'package:dating/controller/profile_image_controller.dart';
import 'package:dating/screen/profile/album_image.dart';
import 'package:dating/screen/profile/change_album_screen.dart';
import 'package:dating/style/constant.dart';
import 'package:dating/style/icon_shape.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

class UploadScreen extends GetView<ProfileImageController> {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return (controller.isReady)
        ? CustomScrollView(
            slivers: [
              _appBar(),
              _preview(),
              ...(controller.album.isNotEmpty)
                  ? [
                      _header(),
                      _images(),
                    ]
                  : [
                      _noImage(),
                    ]
            ],
          )
        : const Center(
            child: CircularProgressIndicator.adaptive(),
          );
  }

  /// 앱바
  Widget _appBar() => SliverAppBar(
        pinned: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: IconShape.iconClose,
            onPressed: controller.backToPreviousPage,
          ),
        ),
        title: Text(
          "사진 업로드",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: ThemeColor.fontColor),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: controller.addNewProfileImage,
              child: Icon(
                Icons.check,
                color: ThemeColor.fontColor,
              ),
            ),
          )
        ],
        toolbarHeight: 65,
      );

  /// 선택한 사진 확인하는 영역
  Widget _preview() {
    return SliverToBoxAdapter(
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Container(
          color: Colors.black,
          child: Container(
            child: (controller.image != null)
                ? Image.file(
                    File(controller.image!.path),
                    fit: BoxFit.fill,
                  )
                : null,
          ),
        ),
      ),
    );
  }

  /// 앨범 선택 버튼 영역, 다양한 옵션 버튼들
  Widget _header() {
    return SliverToBoxAdapter(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
          child: TextButton(
            onPressed: () {
              Get.to(() => const ChangeAlbumScreen(),
                  transition: Transition.downToUp);
            },
            child: Row(
              children: [
                Text(
                  controller.album[controller.idx].name.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }

  Widget _images() {
    return SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
        ),
        itemCount: controller.album[controller.idx].images!.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return GestureDetector(
              onTap: controller.moveToCameraScreen,
              child: Container(
                color: const Color(0xff4d4d4d),
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            );
          } else {
            AssetEntity? image =
                controller.album[controller.idx].images?[index - 1];
            return GestureDetector(
                onTap: () => controller.changeImage(image, index),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    AlbumImage(
                      image: image!,
                    ),
                    Container(
                      color: Colors.white.withOpacity(
                          (controller.selectImageIndex == index) ? 0.4 : 0.0),
                    )
                  ],
                ));
          }
        });
  }

  Widget _noImage() => SliverToBoxAdapter(
        child: Container(
          alignment: Alignment.center,
          height: 250,
          width: double.infinity,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "이미지가 없습니다.",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              GestureDetector(
                onTap: controller.moveToCameraScreen,
                child: Text(
                  " 사진 추가하기",
                  style: TextStyle(
                      color: ThemeColor.fontColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                ),
              )
            ],
          ),
        ),
      );
}
