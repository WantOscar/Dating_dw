import 'package:dating/data/model/feed.dart';
import 'package:dating/style/constant.dart';
import 'package:dating/style/icon_shape.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class FeedWidget extends StatelessWidget {
  final Feed feed;
  const FeedWidget({super.key, required this.feed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showApply(context, feed);
      },
      child: Card(
        elevation: 1.0,
        shadowColor: const Color(0xffdfdfdf),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
        color: Colors.white,
        child: SizedBox(
          height: 200,
          width: double.infinity,
          child: Column(
            children: [
              _profile(context, feed),
              _title(feed),
            ],
          ),
        ),
      ),
    );
  }

  /// 상대방의 피드를 누르면 팝업창이 뜸
  /// 세부 글 내용을 볼 수 있고,
  /// 참여 신청버튼을 통해 신청 가능.
  Future<dynamic> _showApply(BuildContext context, Feed feed) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        title: _profile(context, feed),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _title(feed),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      feed.content.toString(),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          _join(),
        ],
      ),
    );
  }

  /// 글쓴이의 프로필을 보여줌
  /// 우측 아이콘은 글쓴이를 차단/취소 가능.
  Widget _profile(BuildContext context, Feed feed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// 글쓴이 프로필
          Container(
            width: Get.size.width * 0.13,
            height: Get.size.width * 0.13,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white,
            ),
            child: GestureDetector(
              onTap: () {
                // Get.to(() => const SomeoneProfileScreen());
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                    'https://postfiles.pstatic.net/MjAyMjA4MDNfMTA5/MDAxNjU5NDk2ODM5ODg3.uC0PshEiib8q26jwPjQ6GoHdP_h3BIp-0kMw9lOxwdYg.fidwJGXN_KjzDVGvtkJz-212ExplHUOz_3y69_cWz6gg.PNG.duswnekd0/Image_015.png?type=w966',
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
                Row(
                  children: [
                    Text(
                      '홍길동',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        '20세',
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ),
                  ],
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              /// 차단버튼
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

                              /// 나누는 선
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Divider(),
                              ),

                              /// 취소버튼
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
    );
  }

  /// 피드 타이틀을 보여줌
  /// ex) 3:3 과팅 구해요
  Widget _title(Feed feed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          Flexible(
            child: Text(
              feed.title.toString(),
              style: const TextStyle(
                fontSize: 17,
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 참여 신청 버튼
  Widget _join() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                    backgroundColor: ThemeColor.fontColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    joinToast();
                  },
                  child: const Text(
                    '참여하기',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// 참여 신청을 알려주는 알림 함수
  void joinToast() {
    Fluttertoast.showToast(
      msg: '참여 신청하였습니다.',
      backgroundColor: Colors.white,
      gravity: ToastGravity.CENTER,
      fontSize: 17,
      textColor: Colors.black,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 1,
    );
  }
}
