import 'package:dating/widget/common/icon_header.dart';
import 'package:flutter/material.dart';

class BlockedAccountScreen extends StatelessWidget {
  const BlockedAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const IconHeader(text: '차단된 계정'),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            10,
            (index) => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// 글쓴이 프로필
                      Container(
                        width: MediaQuery.of(context).size.width * 0.13,
                        height: MediaQuery.of(context).size.width * 0.13,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            // Get.to(() => const SomeoneProfileScreen(user: ,));
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
                                Icon(Icons.location_on,
                                    size: 20, color: Colors.black),
                                Text(
                                  '성북구',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
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
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF006B),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Text(
                          '차단함',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
