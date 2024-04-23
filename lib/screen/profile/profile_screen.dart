import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dating/Widget/profile/hobby_container.dart';
import 'package:dating/Widget/profile_edit/my_photos.dart';
import 'package:dating/screen/profile/profile_edit_screen.dart';
import 'package:dating/screen/profile/setting_profile.screen.dart';
import 'package:dating/style/constant.dart';
import 'package:dating/style/icon_shape.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _SomeoneProfileScreenState();
}

class _SomeoneProfileScreenState extends State<ProfileScreen> {
  final List<String> images = [
    'https://img.tvreportcdn.de/cms-content/uploads/2023/10/20/93f856ee-e4ac-49a4-a4a1-df134b34bb8a.jpg',
    'https://file.sportsseoul.com/news/cms/2024/01/04/news-p.v1.20240104.de25dc94af0b4040a998eee49d73c995_P1.png',
    'https://file.sportsseoul.com/news/cms/2024/01/04/news-p.v1.20240104.448eb72daab14eb2bd91f4241c2e1d1f_P1.png',
    'https://file.sportsseoul.com/news/cms/2024/01/04/news-p.v1.20240104.9e1be962b18e4f35b7a048682b5aa116_P1.png',
    'https://cdn.mediafine.co.kr/news/photo/202310/43998_70230_3725.jpg',
    'https://talkimg.imbc.com/TVianUpload/tvian/TViews/image/2023/04/19/dfc7ca64-8974-4fdf-ac8e-34dfd9d27eed.jpg',
  ];
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // Obx(
          //   () {
          //     if (UserController.to.status == Status.LOADING) {
          //       return const Center(
          //         child: CircularProgressIndicator.adaptive(),
          //       );
          //     } else if (UserController.to.status == Status.ERROR) {
          //       return const Center(
          //         child: Text("에러가 발생했습니다."),
          //       );
          //     } else {
          //       return _buildBody();
          //     }
          //   },
          // ),
          CustomScrollView(
        slivers: [
          _appBar(),
          _profile(),
          _info(),
          _personality(),
          _interesting(),
          _idealType(),
          _story(),
        ],
      ),
    );
  }

  Widget _profileImages() {
    return CarouselSlider.builder(
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
    );
  }

  Widget _options() {
    return Row(
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
    );
  }

  Widget _appBar() => SliverAppBar(
        pinned: true,
        leading: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text(
            "프로필",
            style: TextStyle(
                fontSize: 25,
                color: ThemeColor.fontColor,
                fontWeight: FontWeight.bold),
          ),
        ),
        toolbarHeight: 65,
        leadingWidth: 200,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Get.to(() => const SettingProfileScreen());
              },
              icon: IconShape.iconSettings,
            ),
          ),
        ],
      );

  Widget _profile() => SliverToBoxAdapter(
        child: Stack(
          children: [
            /// 내 프로필 사진들
            _profileImages(),

            /// 이미지 슬라이더
            Positioned(
              right: 10,
              left: 10,
              bottom: 10,
              child: _options(),
            ),

            /// 내 이름
            // ProfilePositionedName(user: UserController.to.myInfo!),
            Positioned(
              top: 240,
              left: 20,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  '아무개',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            /// 내 나이
            // ProfilePositionedAge(user: UserController.to.myInfo!),
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
                    '22세',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    '167cm',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),

            /// 내 위치
            // ProfilePositionedLocation(user: UserController.to.myInfo!),
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

            /// 프로필 편집 버튼
            Positioned(
              top: 340,
              right: 20,
              // child: ProfileEditButton(),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ThemeColor.fontColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileEditScreen(),
                    ),
                  );
                },
                child: const Text(
                  '프로필 편집',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

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

  Widget _story() => SliverPadding(
        padding: const EdgeInsets.only(
            top: 40.0, bottom: 80.0, right: 1.0, left: 1.0),
        sliver: SliverGrid.builder(
            itemCount: 3,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 1.0, crossAxisSpacing: 1.0),
            itemBuilder: (context, index) => const MyPhotos()),
      );
}
