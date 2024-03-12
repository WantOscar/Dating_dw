import 'package:carousel_slider/carousel_slider.dart';
import 'package:dating/Widget/common_header.dart';
import 'package:dating/Widget/main/interested_friends.dart';
import 'package:dating/Widget/main/interested_friends_box.dart';
import 'package:dating/Widget/main/interested_me.dart';
import 'package:dating/Widget/main/interested_me_box.dart';
// import 'package:dating/Widget/main/mbti_recommend.dart';
import 'package:dating/Widget/main/profile_main.dart';
// import 'package:dating/Widget/main/today_meet.dart';
// import 'package:dating/Widget/main/today_meet_box.dart';
import 'package:dating/controller/user_controller.dart';
// import 'package:dating/data/model/mbti.dart';
// import 'package:dating/data/repository/mbti_repository.dart';
import 'package:dating/screen/main/alarm_screen.dart';
import 'package:dating/style/icon_shape.dart';
import 'package:dating/utils/status_enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends GetView<UserController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonHeader(
        text: '캠밋',
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Get.to(() => const AlarmScreen());
              },
              icon: IconShape.iconNotificationOutline,
            ),
          ),
        ],
      ),
      body: Obx(
        () => RefreshIndicator.adaptive(
            onRefresh: controller.fetchData,
            child: (controller.status == Status.LOADING)
                ? const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : _buildBody()),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Photo Carousel
          (controller.users.isNotEmpty)
              ? CarouselSlider.builder(
                  itemCount: controller.users.length,
                  itemBuilder: (context, index, realIndex) {
                    final user = controller.users[index];
                    return ProfileMain(
                      user: user,
                    );
                  },
                  options: CarouselOptions(
                      enlargeCenterPage: true,
                      aspectRatio: 1,
                      autoPlay: true,
                      viewportFraction: 0.8),
                )
              : const SizedBox(
                  height: 300,
                  child: Center(
                    child: Text(
                      "아직 사용자 없습니다 !",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
          const SizedBox(height: 40),

          // Title and Info
          // const TodayMeet(),
          // const SizedBox(height: 20),

          // // Gesture Box List
          // const SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: TodayMeetBox(),
          // ),
          // const SizedBox(height: 30),

          // 내가 관심있는 친구
          const InterestedFriends(),

          // 내가 관심있는 친구 목록
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: InterestedFriendsBox(),
          ),
          const SizedBox(height: 30),

          // 나한테 관심있는 친구
          const InterestedMe(),

          // 나한테 관심있는 친구 목록
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: InterestedMeBox(),
          ),
          const SizedBox(height: 20),

          // mbti별 추천 조합
          // FutureBuilder<List<Mbti>>(
          //   future: MbtiRepository().getListMbtiData(),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return const Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     } else if (snapshot.hasError) {
          //       return Center(
          //         child: Text('Error : ${snapshot.error}'),
          //       );
          //     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          //       return const Center(
          //         child: Text('No Data Available'),
          //       );
          //     } else {
          //       List<Mbti> mbtis = snapshot.data!;
          //       int index = 0;
          //       final mbti = mbtis[index];
          //       return MbtiRecommend(
          //         mbti: mbti,
          //       );
          //     }
          //   },
          // ),
        ],
      ),
    );
  }
}
