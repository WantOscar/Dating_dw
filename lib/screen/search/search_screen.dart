import 'package:dating/Widget/search/feed_widget.dart';
import 'package:dating/controller/feed_controller.dart';
import 'package:dating/style/icon_shape.dart';
import 'package:dating/widget/common/cammit_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends GetView<FeedController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: CammitAppBar(
          title: '탐색',
          actions: [
            GestureDetector(
              onTap: controller.moveToWriteScreen,
              child: IconShape.iconEditNote,
            ),
          ],
        ),
      ),
      body: Obx(() => (controller.isLoading) ? _loading() : _body()),
    );
  }

  Widget _loading() => const Center(
        child: CircularProgressIndicator(),
      );

  Widget _body() => (controller.feeds.isEmpty)
      ? const Center(
          child: Text("아직 피드가 없습니다."),
        )
      : SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 70),
            child: Column(
              /// 글 목록 10개 지정
              children: List.generate(
                controller.feeds.length,
                (index) {
                  final feed = controller.feeds[index];

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FeedWidget(feed: feed),
                  );
                },
              ),
            ),
          ),
        );
}
