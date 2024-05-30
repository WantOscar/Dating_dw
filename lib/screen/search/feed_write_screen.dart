import 'package:dating/Widget/common/bottom_button.dart';
import 'package:dating/Widget/common/cammit_app_bar.dart';
import 'package:dating/controller/feed_write_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedWriteScreen extends GetView<FeedWriteController> {
  const FeedWriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: CammitAppBar(
          showCloseButton: true,
          backAction: controller.cancel,
          title: "글 쓰기",
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              _title(),
              sub(),
              const SizedBox(height: 170),
              _completeButton(),
            ],
          ),
        ),
      ),
    );
  }

  /// 제목 쓰기 칸(title)
  Widget _title() {
    return Padding(
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
            child: TextField(
              controller: controller.title,
              maxLength: 30,
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: '제목을 작성해주세요.',
                border: InputBorder.none,
                counterText: '',
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 세부 글 작성 칸(sub)
  Widget sub() {
    return Padding(
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
            child: TextField(
              controller: controller.content,
              maxLength: 50,
              maxLines: 30,
              decoration: const InputDecoration(
                hintText: '글을 작성해주세요.',
                border: InputBorder.none,
                counterText: '',
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 작성을 완료한 후,
  /// 이 버튼을 누르면 탐색 창에서 작성한 글이 올라감.
  Widget _completeButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: BottomButton(
        onTap: controller.writeFeed,
        child: const Text(
          "작성 완료",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
