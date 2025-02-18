import 'package:dating/Widget/common/cammit_app_bar.dart';
import 'package:dating/Widget/profile/user_profile_widget.dart';
import 'package:dating/Widget/search/feed_widget.dart';
import 'package:dating/controller/chat_controller.dart';
import 'package:dating/controller/feed_controller.dart';
import 'package:dating/controller/member_block_controller.dart';
import 'package:dating/controller/user_controller.dart';
import 'package:dating/data/model/feed.dart';
import 'package:dating/data/model/user.dart';
import 'package:dating/style/constant.dart';
import 'package:dating/style/icon_shape.dart';
import 'package:dating/widget/common/chat_send_button.dart';
import 'package:dating/widget/common/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SomeoneProfileScreen extends GetView<UserController> {
  final User user;
  const SomeoneProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _fabs(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: CammitAppBar(
          backAction: () => Get.back(),
          title: "상대 프로필",
          centerTitle: true,
          showCloseButton: true,
          actions: [
            IconButton(
              onPressed: () {
                /// 우측 상단 ... 아이콘 누르면 바텀에서 차단/취소 여부 시트가 나옴
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Wrap(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3.0),
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    await MemberBlockController.to
                                        .memberBlock(user.id!);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(10.0),
                                    width: double.infinity,
                                    child: Text(
                                      '차단',
                                      style: TextStyle(
                                        color: ThemeColor.fontColor,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Divider(),
                                ),
                                InkWell(
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(10.0),
                                    child: const Text(
                                      '취소',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Get.back();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  backgroundColor: Colors.transparent,
                );
              },
              icon: IconShape.iconMore,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _profile(),
            Obx(() => (!controller.isLoading) ? _loading() : _otherFeed()),
            const SliverToBoxAdapter(
              child: SizedBox(height: 100),
            ),
          ],
        ),
      ),
    );
  }

  /// 상대방의 프로필을 보여주는 위젯
  Widget _profile() => SliverToBoxAdapter(
        child: UserProfileWidget(
          user: user,
        ),
      );

  /// 상대방의 프로필에서 채팅신청 or 좋아요를 누를 수 있는 위젯
  Widget _fabs(context) => SizedBox(
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ChatSendButtom(
                  onPressed: () {
                    ChatController.to.makeChattingRoom(user, ChatType.dm);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FavoriteButton(
                onTap: () {
                  controller.postHeartAdd(user.id!);
                },
              ),
            )
          ],
        ),
      );

  Widget _loading() => const SliverToBoxAdapter(
        child: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      );

  Widget _otherFeed() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final Feed feed = FeedController.to.historys[index];
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
            child: FeedWidget(
              feed: feed,
              onTap: () => FeedController.to.showMyFeedOption(feed),
            ),
          );
        },
        childCount: FeedController.to.historys.length,
      ),
    );
  }
}
