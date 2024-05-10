import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dating/Widget/profile/hobby_container.dart';
import 'package:dating/Widget/profile_edit/my_photos.dart';
import 'package:dating/controller/profile_edit_controller.dart';
import 'package:dating/controller/setting_controller.dart';
import 'package:dating/screen/profile/profile_edit_screen.dart';
import 'package:dating/screen/profile/setting_profile.screen.dart';
import 'package:dating/style/constant.dart';
import 'package:dating/style/icon_shape.dart';
import 'package:dating/widget/common/cammit_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SomeoneProfileScreen extends StatefulWidget {
  const SomeoneProfileScreen({super.key});

  @override
  State<SomeoneProfileScreen> createState() => _SomeoneProfileScreenState();
}

class _SomeoneProfileScreenState extends State<SomeoneProfileScreen> {
  final List<String> images = [
    'https://imgnews.pstatic.net/image/015/2023/09/05/0004887746_001_20230905124105171.jpg?type=w647',
    'https://image.xportsnews.com/contents/images/upload/article/2022/1224/1671876788340459.jpg',
    'https://imgnews.pstatic.net/image/241/2023/02/16/0003257608_001_20230216112903475.jpg?type=w647',
    'https://postfiles.pstatic.net/MjAyMzAzMzFfNDkg/MDAxNjgwMjY4Nzg4NTE1.bpksu-ULqGXjw9D2wTa-SAtgsPbg6WV_nu7KptNtvgUg.fY9dUrFyNlcy7N806tcLeWp8WyAFHcTzds-BbqSWnYkg.JPEG.namah2016/Screenshot%EF%BC%BF20230331%EF%BC%8D221139%EF%BC%BFChrome.jpg?type=w966',
    'https://postfiles.pstatic.net/MjAyMzAzMzFfMTYz/MDAxNjgwMjY4Nzg2MDAy.Nm2AJDl7njNc8pgfFidJm9LkPma5YDVPvgsBmTM0uXcg.mcFue_6OBYLdyolGB_XqKGFFNKJGLmXz4dTgsVuml4Yg.JPEG.namah2016/Screenshot%EF%BC%BF20230331%EF%BC%8D220812%EF%BC%BFChrome.jpg?type=w966',
    'https://www.sportsq.co.kr/news/photo/202211/446549_491017_2625.jpg',
  ];

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _appbar(context),
          _profile(),
          _info(),
          _personality(),
          _interesting(),
          _idealType(),
          _storyHeader(),
          _story(),
        ],
      ),
    );
  }

  /// 사용자의 프로필을 보여주는 위젯
  Widget _profile() => SliverToBoxAdapter(
        child: Stack(
          children: [
            /// 사용자의 프로필 이미지를 보여주는 슬라이더 위젯
            CarouselSlider.builder(
              itemCount: images.length,
              itemBuilder: (context, index, realIndex) {
                return AspectRatio(
                  aspectRatio: 1.1,
                  child: Container(
                    color: Colors.black,
                    child: ClipRRect(
                      child: CachedNetworkImage(
                        imageUrl: images[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                enableInfiniteScroll: false,
                aspectRatio: 1,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
            ),

            /// 이미지 슬라이더
            Positioned(
              right: 10,
              left: 10,
              bottom: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (images.length == 1)
                      ? Container()
                      : AnimatedSmoothIndicator(
                          activeIndex: _current,
                          count: images.length,
                          effect: ScrollingDotsEffect(
                            dotColor: Colors.grey,
                            activeDotColor: ThemeColor.fontColor,
                            activeDotScale: 1,
                            spacing: 4.0,
                            dotWidth: 10.0,
                            dotHeight: 10.0,
                          ),
                        ),
                ],
              ),
            ),

            /// 내 닉네임을 보여줌
            Positioned(
              top: 240,
              left: 20,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  '강해린',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            /// 내 나이와 키를 보여줌
            Positioned(
              top: 300,
              left: 20,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: IconShape.iconPerson,
                  ),
                  const Text(
                    '17세',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    '164.5cm',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),

            /// 내 위치를 나타냄
            Positioned(
              top: 320,
              left: 20,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: IconShape.iconLocationOn,
                  ),
                  const Text(
                    '서울 강북구',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),

            /// 채팅하기 버튼
            Positioned(
              top: 340,
              right: 80,
              child: SizedBox(
                height: 50,
                child: Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        chatToast();
                      },
                      child: Text(
                        '채팅하기',
                        style: TextStyle(
                            fontSize: 17,
                            color: ThemeColor.fontColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            /// 좋아요 누르기 버튼
            Positioned(
              top: 340,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  likeToast();
                },
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: ThemeColor.fontColor,
                            shape: BoxShape.circle),
                        child: IconShape.iconFavorite,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  /// 내 인적사항을 보여줌
  Widget _info() => const SliverToBoxAdapter(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
              child: Text('인적사항'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.start,
                spacing: 5,
                runSpacing: 5,
                children: [
                  HobbyContainer(
                    text: '일반대',
                  ),
                  HobbyContainer(
                    text: '학생',
                  ),
                  HobbyContainer(
                    text: 'ESTP',
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  /// 내 성격을 보여줌
  Widget _personality() => const SliverToBoxAdapter(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
              child: Text('성격'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.start,
                spacing: 5,
                runSpacing: 5,
                children: [
                  HobbyContainer(
                    text: '털털한',
                  ),
                  HobbyContainer(
                    text: '기모띠',
                  ),
                  HobbyContainer(
                    text: '자유로운',
                  ),
                  HobbyContainer(
                    text: '유쾌한',
                  ),
                  HobbyContainer(
                    text: '대담한',
                  ),
                  HobbyContainer(
                    text: '보수적인',
                  ),
                  HobbyContainer(
                    text: '재밌는',
                  ),
                  HobbyContainer(
                    text: '호전적인',
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  /// 내 관심사를 보여줌
  Widget _interesting() => const SliverToBoxAdapter(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
              child: Text('관심사'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.start,
                spacing: 5,
                runSpacing: 5,
                children: [
                  HobbyContainer(
                    text: '게임',
                  ),
                  HobbyContainer(
                    text: 'IT',
                  ),
                  HobbyContainer(
                    text: '운동',
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  /// 내 이상형을 보여줌
  Widget _idealType() => const SliverToBoxAdapter(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
              child: Text('이상형'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.start,
                spacing: 5,
                runSpacing: 5,
                children: [
                  HobbyContainer(
                    text: '예쁜',
                  ),
                  HobbyContainer(
                    text: '귀여운',
                  ),
                  HobbyContainer(
                    text: '섹시한',
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _appbar(BuildContext context) {
    return SliverAppBar(
      elevation: 0.0,
      pinned: true,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          icon: IconShape.iconClose,
          onPressed: () {
            Get.back();
          },
        ),
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        "상대 프로필",
        style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: ThemeColor.fontColor),
      ),
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
                              onTap: () {},
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
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
          icon: const Icon(Icons.more_vert, color: Colors.black, size: 25),
        ),
      ],
    );
  }

  Widget _storyHeader() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          '스토리',
          style: TextStyle(
              color: ThemeColor.fontColor,
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _story() {
    return SliverGrid.builder(
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 2.0, crossAxisSpacing: 2.0, crossAxisCount: 3),
      itemBuilder: (contex, index) {
        return const MyPhotos();
      },
    );
  }
}

/// 채팅신청이 되었다는 것을 알려주는 알림 함수
void chatToast() {
  Fluttertoast.showToast(
    msg: '채팅을 신청하였습니다',
    backgroundColor: Colors.white,
    gravity: ToastGravity.CENTER,
    fontSize: 17,
    textColor: Colors.black,
    toastLength: Toast.LENGTH_SHORT,
    timeInSecForIosWeb: 1,
  );
}

/// 좋아요를 보냈다는 것을 알려주는 알림 함수
void likeToast() {
  Fluttertoast.showToast(
    msg: '좋아요를 보냈습니다.',
    backgroundColor: Colors.white,
    gravity: ToastGravity.CENTER,
    fontSize: 17,
    textColor: Colors.black,
    toastLength: Toast.LENGTH_SHORT,
    timeInSecForIosWeb: 1,
  );
}
