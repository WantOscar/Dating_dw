import 'package:dating/controller/feed_write_controller.dart';
import 'package:dating/screen/profile/someone_profile_screen.dart';
import 'package:dating/screen/search/feed_write_screen.dart';
import 'package:dating/style/constant.dart';
import 'package:dating/style/icon_shape.dart';
import 'package:dating/widget/common/cammit_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: CammitAppBar(
          title: '탐색',
          actions: [
            GestureDetector(
              onTap: () {
                Get.to(() => const FeedWriteScreen(),
                    binding: BindingsBuilder(() {
                  Get.put(FeedWriteController());
                }));
              },
              child: Icon(
                Icons.add,
                color: ThemeColor.fontColor,
                size: 30,
              ),
            ),
          ],
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    final width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 70),
        child: Column(
          /// 글 목록 10개 지정
          children: List.generate(
            10,
            (index) => Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  width: width * 0.9,
                  height: width * 1.2,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 206, 204, 204),
                        Color.fromARGB(255, 226, 109, 148),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      _writerProfile(),
                      _write(),
                      _joinBtn(),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(color: Colors.grey),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 글쓴이 프로필과 간략한 정보
  Padding _writerProfile() {
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// 글쓴이 프로필
              Container(
                width: width * 0.13,
                height: width * 0.13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                ),
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => const SomeoneProfileScreen());
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                        'https://img.khan.co.kr/news/2024/03/06/news-p.v1.20240306.36d040a925cd45deb5d87d7f2a0771fb_P1.webp',
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              const SizedBox(width: 10),

              /// 글쓴이 정보
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '홍길동',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 20, color: Colors.black),
                        Text(
                          '성북구',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            '20세',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// 차단 여부 버튼
              IconButton(
                onPressed: () {
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
        ],
      ),
    );
  }

  /// 참여 신청 버튼
  Widget _joinBtn() {
    return Positioned(
      bottom: 10,
      child: SizedBox(
        height: 50,
        child: Card(
          elevation: 5.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
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
                joinToast();
              },
              child: Text(
                '참여하기',
                style: TextStyle(
                    fontSize: 17,
                    color: ThemeColor.fontColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _write() {
    return Text('과팅할사람~');
  }
}

/// 참여 신청을 알려주는 알림 함수
void joinToast() {
  Fluttertoast.showToast(
    msg: '참여 신청하였습니다.',
    backgroundColor: Colors.white,
    gravity: ToastGravity.TOP,
    fontSize: 17,
    textColor: Colors.black,
    toastLength: Toast.LENGTH_SHORT,
    timeInSecForIosWeb: 1,
  );
}
