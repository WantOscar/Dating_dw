import 'package:dating/Widget/common/icon_header.dart';
import 'package:dating/controller/feed_write_controller.dart';
import 'package:dating/screen/profile/upload_screen.dart';
import 'package:dating/style/constant.dart';
import 'package:dating/style/icon_shape.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedWriteScreen extends GetView<FeedWriteController> {
  const FeedWriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IconHeader(
        text: '글 쓰기',
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: IconShape.iconArrowGoto,
          ),
        ],
      ),
      floatingActionButton: _uploadPhoto(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              /// 사진 업로드를 하지 않으면 빈 컨테이너, 업로드를 하면 컨테이너 안에 사진 추가
              Container(),

              /// 글 작성하기
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: controller.textController,
                  maxLines: 20,
                  decoration: const InputDecoration(
                    hintText: '글을 작성해주세요.',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 글에 사진을 추가하기 위한 플로팅액션버튼
  FloatingActionButton _uploadPhoto() {
    return FloatingActionButton(
      onPressed: () {
        Get.to(() => const UploadScreen());
      },
      backgroundColor: ThemeColor.fontColor,
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      child: const Icon(
        Icons.photo_camera,
        color: Colors.white,
        size: 20,
      ),
    );
  }
}
