import 'package:dating/widget/search/feed_widget.dart';
import 'package:dating/controller/feed_controller.dart';
import 'package:dating/data/model/feed.dart';
import 'package:dating/style/icon_shape.dart';
import 'package:dating/widget/common/cammit_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends GetView<FeedController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
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
      : Column(
          children: [
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.only(top: 12.0),
                  itemBuilder: (context, index) {
                    final Feed feed = controller.feeds[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 14.0, horizontal: 16.0),
                      child: FeedWidget(feed: feed),
                    );
                  },
                  itemCount: controller.feeds.length),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        );

  PreferredSizeWidget _appBar() => PreferredSize(
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
      );
}
