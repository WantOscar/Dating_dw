import 'package:dating/widget/common/image_data.dart';
import 'package:dating/Widget/search/feed_widget.dart';
import 'package:dating/controller/feed_controller.dart';
import 'package:dating/controller/user_controller.dart';
import 'package:dating/data/model/feed.dart';
import 'package:dating/screen/search/feed_write_screen.dart';
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
                  physics: const BouncingScrollPhysics(),
                  controller: controller.scrollController,
                  padding: const EdgeInsets.only(top: 12.0),
                  itemBuilder: (context, index) {
                    final Feed feed = controller.feeds[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 14.0, horizontal: 16.0),
                      child: FeedWidget(
                        feed: feed,
                        onTap: () => (feed.user != UserController.to.myInfo!)
                            ? controller.showFeedOption(feed)
                            : controller.showMyFeedOption(feed),
                      ),
                    );
                  },
                  itemCount: controller.feeds.length),
            ),
            const SizedBox(
              height: 100,
            ),
            if (controller.nextLoading)
              Container(
                padding: const EdgeInsets.all(30),
                child: const CircularProgressIndicator.adaptive(),
              )
          ],
        );

  PreferredSizeWidget _appBar() => PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CammitAppBar(
          title: '탐색',
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    () => const FeedWriteScreen(),
                  );
                },
                child: ImageData(
                  path: ImagePath.feedWriteIcon,
                ),
              ),
            ),
          ],
        ),
      );
}
