import 'package:dating/Widget/profile/user_profile_widget.dart';
import 'package:dating/Widget/search/feed_widget.dart';
import 'package:dating/controller/feed_controller.dart';
import 'package:dating/controller/profile_edit_controller.dart';
import 'package:dating/controller/setting_controller.dart';
import 'package:dating/controller/user_controller.dart';
import 'package:dating/data/model/feed.dart';
import 'package:dating/data/repository/user_repository.dart';
import 'package:dating/screen/profile/profile_edit_screen.dart';
import 'package:dating/screen/profile/setting_account_screen.dart';
import 'package:dating/style/constant.dart';
import 'package:dating/utils/api_urls.dart';
import 'package:dating/utils/dio_intercepter.dart';
import 'package:dating/widget/common/cammit_app_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends GetView<UserController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: PreferredSize(
          preferredSize: AppBar().preferredSize,
          child: CammitAppBar(
            title: "프로필",
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 14.0),
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => const SettingAccountScreen(),
                        binding: BindingsBuilder(() {
                      Get.put(SettingController());
                    }));
                  },
                  child: Icon(
                    Icons.settings,
                    color: ThemeColor.fontColor,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 70),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              _profile(),
              _myFeedList(),
              Obx(() => (!controller.isLoading) ? _loading() : _myFeed()),
              const SliverToBoxAdapter(
                child: SizedBox(height: 100),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profile() => SliverToBoxAdapter(
        child: Stack(
          children: [
            UserProfileWidget(user: controller.myInfo!),
            _editProfile(),
          ],
        ),
      );

  Widget _editProfile() => Positioned(
        right: 20,
        bottom: 44,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ThemeColor.fontColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {
            Get.to(() => const ProfileEditScreen(),
                binding: BindingsBuilder(() {
              Get.put(ProfileEditController(
                  userRepository: UserRepositoryImpl(
                      dio: Dio(BaseOptions(baseUrl: ApiUrl.baseUrl))
                        ..interceptors.add(AuthInterceptor())
                        ..interceptors.add(BaseIntercepter()))));
            }));
          },
          child: const Text(
            '프로필 편집',
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

  Widget _myFeedList() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 23.0),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            const SizedBox(height: 23),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7.0),
              child: Row(
                children: [
                  Text(
                    '내가 쓴 피드',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: ThemeColor.fontColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7.0),
              child: Row(
                children: [
                  SizedBox(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 6.0),
                        child: Text(
                          '게시물',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      '${FeedController.to.historys.length}개',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _loading() => const SliverToBoxAdapter(
        child: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      );

  Widget _myFeed() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final Feed feed = FeedController.to.historys[index];
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 14.0, horizontal: 23.0),
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
