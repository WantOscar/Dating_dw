import 'package:dating/Widget/common/icon_header.dart';
import 'package:dating/controller/feed_write_controller.dart';
import 'package:dating/screen/profile/upload_screen.dart';
import 'package:dating/style/constant.dart';
import 'package:dating/style/icon_shape.dart';
import 'package:dotted_border/dotted_border.dart';
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

              /// 제목 쓰기 칸(title)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DottedBorder(
                  strokeWidth: 2,
                  color: Colors.grey,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10),
                  dashPattern: const [5, 5],
                  child: SizedBox(
                    height: Get.size.width * 0.15,
                    width: Get.size.width * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Flexible(
                        child: TextField(
                          controller: controller.textController1,
                          maxLength: 30,
                          decoration: const InputDecoration(
                            hintText: '제목을 작성해주세요.',
                            border: InputBorder.none,
                            counterText: '',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              /// 세부 글 작성 칸(sub)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DottedBorder(
                  strokeWidth: 2,
                  color: Colors.grey,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10),
                  dashPattern: const [5, 5],
                  child: SizedBox(
                    height: Get.size.width * 0.6,
                    width: Get.size.width * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Flexible(
                        child: TextField(
                          controller: controller.textController2,
                          maxLength: 50,
                          decoration: const InputDecoration(
                            hintText: '글을 작성해주세요.',
                            border: InputBorder.none,
                            counterText: '',
                          ),
                        ),
                      ),
                    ),
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
