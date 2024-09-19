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
              GestureDetector(
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
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 70),
          child: CustomScrollView(
            slivers: [
              _profile(),
              // _personality(),
              // _interesting(),
              // _idealType(),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 100,
                ),
              ),
              Obx(() => (controller.isLoading) ? _loading() : _myFeed()),
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

  Widget _loading() => const SliverToBoxAdapter(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );

  Widget _myFeed() {
    return (FeedController.to.feeds.isEmpty)
        ? const SliverToBoxAdapter(child: SizedBox.shrink())
        : SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final Feed feed = FeedController.to.feeds[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 14.0, horizontal: 16.0),
                  child: FeedWidget(feed: feed),
                );
              },
              childCount: FeedController.to.feeds.length,
            ),
          );
  }

  /// 내 인적사항을 보여줌
  // Widget _info() => const SliverToBoxAdapter(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Padding(
  //             padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
  //             child: Text('인적사항'),
  //           ),
  //           Padding(
  //             padding: EdgeInsets.symmetric(horizontal: 20.0),
  //             child: Wrap(
  //               direction: Axis.horizontal,
  //               alignment: WrapAlignment.start,
  //               spacing: 5,
  //               runSpacing: 5,
  //               children: [
  //                 HobbyContainer(
  //                   text: '일반대',
  //                 ),
  //                 HobbyContainer(
  //                   text: '학생',
  //                 ),
  //                 HobbyContainer(
  //                   text: 'ESTP',
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     );

  /// 내 성격을 보여줌
  // Widget _personality() => const SliverToBoxAdapter(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Padding(
  //             padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
  //             child: Text('성격'),
  //           ),
  //           Padding(
  //             padding: EdgeInsets.symmetric(horizontal: 20.0),
  //             child: Wrap(
  //               direction: Axis.horizontal,
  //               alignment: WrapAlignment.start,
  //               spacing: 5,
  //               runSpacing: 5,
  //               children: [
  //                 HobbyContainer(
  //                   text: '털털한',
  //                 ),
  //                 HobbyContainer(
  //                   text: '기모띠',
  //                 ),
  //                 HobbyContainer(
  //                   text: '자유로운',
  //                 ),
  //                 HobbyContainer(
  //                   text: '유쾌한',
  //                 ),
  //                 HobbyContainer(
  //                   text: '대담한',
  //                 ),
  //                 HobbyContainer(
  //                   text: '보수적인',
  //                 ),
  //                 HobbyContainer(
  //                   text: '재밌는',
  //                 ),
  //                 HobbyContainer(
  //                   text: '호전적인',
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     );

  /// 내 관심사를 보여줌
  // Widget _interesting() => const SliverToBoxAdapter(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Padding(
  //             padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
  //             child: Text('관심사'),
  //           ),
  //           Padding(
  //             padding: EdgeInsets.symmetric(horizontal: 20.0),
  //             child: Wrap(
  //               direction: Axis.horizontal,
  //               alignment: WrapAlignment.start,
  //               spacing: 5,
  //               runSpacing: 5,
  //               children: [
  //                 HobbyContainer(
  //                   text: '게임',
  //                 ),
  //                 HobbyContainer(
  //                   text: 'IT',
  //                 ),
  //                 HobbyContainer(
  //                   text: '운동',
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     );

  /// 내 이상형을 보여줌
  // Widget _idealType() => const SliverToBoxAdapter(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Padding(
  //             padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
  //             child: Text('이상형'),
  //           ),
  //           Padding(
  //             padding: EdgeInsets.symmetric(horizontal: 20.0),
  //             child: Wrap(
  //               direction: Axis.horizontal,
  //               alignment: WrapAlignment.start,
  //               spacing: 5,
  //               runSpacing: 5,
  //               children: [
  //                 HobbyContainer(
  //                   text: '예쁜',
  //                 ),
  //                 HobbyContainer(
  //                   text: '귀여운',
  //                 ),
  //                 HobbyContainer(
  //                   text: '섹시한',
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     );
}
