import 'package:dating/data/model/main_response.dart';
import 'package:dating/data/model/user.dart';
import 'package:dating/screen/profile/someone_profile_screen.dart';
import 'package:dating/style/constant.dart';
import 'package:dating/style/icon_shape.dart';
import 'package:flutter/material.dart';

class ProfileMain extends StatelessWidget {
  final Map<String, dynamic> randomUser;
  const ProfileMain({super.key, required this.randomUser});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: width * 0.8,
      height: height * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Stack(
          children: [
            /// 오늘의 추천인 사진
            Image.network(
              randomUser["image"] ??
                  'https://image.news1.kr/system/photos/2022/12/16/5742694/article.jpg/dims/quality/80/optimize',
              fit: BoxFit.cover,
              width: width * 0.8,
              height: height * 0.8,
            ),

            /// 오늘의 추천인 현재 활동 여부
            Positioned(
              bottom: width * 0.45,
              left: height * 0.04,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 2.5),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF006B),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "ONLINE",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),

            /// 오늘의 추천인 이름
            Positioned(
              bottom: width * 0.3,
              left: height * 0.04,
              child: Text(
                '${randomUser["name"]}',
                style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),

            /// 오늘의 추천인 나이, 신장
            Positioned(
              bottom: width * 0.22,
              left: height * 0.04,
              child: const Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 20,
                  ),
                  // Text(
                  //   '${user.residence} ${user.height}cm',
                  //   style: const TextStyle(
                  //       fontSize: 12,
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.white),
                  // ),
                ],
              ),
            ),

            /// 나와 추천인의 현재 거리
            Positioned(
              bottom: width * 0.17,
              left: height * 0.04,
              child: const Row(
                children: [
                  Icon(Icons.location_on, color: Colors.white, size: 20),
                  Text(
                    '홍대 1.2Km',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),

            /// 추천인과 채팅하기
            Positioned(
              bottom: width * 0.035,
              left: height * 0.03,
              child: SizedBox(
                height: 50,
                child: Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
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

            /// 추천인에게 좋아요 누르기 버튼
            Positioned(
              bottom: width * 0.024,
              left: height * 0.38,
              child: GestureDetector(
                onTap: () {
                  likeToast();
                },
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: ThemeColor.fontColor,
                          shape: BoxShape.circle,
                        ),
                        child: IconShape.iconFavorite,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
