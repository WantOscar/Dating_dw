import 'package:dating/controller/init_profile_upload_screen_controller.dart';
import 'package:dating/screen/profile/init_profile_upload_screen.dart';
import 'package:dating/style/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("프로필 생성"),
          titleTextStyle: TextStyle(
              color: ThemeColor.fontColor,
              fontSize: 20,
              fontWeight: FontWeight.w600),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _thumNails(),
              _basicProfiles(),
              _optionalProfiles(),
              _createProfileButton(),
            ],
          ),
        ),
      ),
    );
  }

  /// 선택한 프로필 이미지를 보여주는 프리뷰 위젯
  /// 하단의 카메라 버튼을 통해서 이미지를 불러올 수 있음.
  Widget _thumNails() {
    List<List<Color>> defaultThumNailBoxColors = [
      [
        const Color(0xffcfa9a9),
        const Color(0xffe7d3d3),
        const Color(0xffffd4d4),
      ],
      [
        const Color(0xffebebeb),
        const Color(0xffffa5a5),
        const Color(0xffb8afaf),
      ]
    ];
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              2,
              (i) => Row(
                    children: List.generate(
                        3,
                        (j) => Expanded(
                              child: AspectRatio(
                                aspectRatio: 1.0,
                                child: Container(
                                  color: defaultThumNailBoxColors[i][j],
                                ),
                              ),
                            )),
                  )),
        ),
        Positioned(
          bottom: 10.0,
          right: 10.0,
          child: GestureDetector(
            onTap: () {
              Get.to(() => const InitProfileUploadScreen(),
                  binding: BindingsBuilder(() {
                Get.put(InitProfileUploadScreenController());
              }), transition: Transition.downToUp);
            },
            child: Card(
              elevation: 3.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.photo_camera,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  /// 사용자가 기본 프로필 정보를 입력하는 위젯
  /// 이 위젯은 반드시 정보를 기입해야만,
  /// 프로필 등록을 완료할 수 있음.
  Widget _basicProfiles() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Row(
              children: [
                Text(
                  "기본정보",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff848484)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(12.0)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: const TextField(
                    cursorColor: Colors.black87,
                    decoration: InputDecoration(
                        hintText: "닉네임",
                        hintStyle:
                            TextStyle(fontSize: 15, color: Color(0xffafafaf)),
                        border: InputBorder.none,
                        fillColor: Color(0xffefefef),
                        filled: true),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                          color: const Color(0xffefefef),
                          borderRadius: BorderRadius.circular(8.0)),
                      child: const Text(
                        "남성",
                        style:
                            TextStyle(fontSize: 15, color: Color(0xffafafaf)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                          color: const Color(0xffefefef),
                          borderRadius: BorderRadius.circular(8.0)),
                      child: const Text(
                        "여성",
                        style:
                            TextStyle(fontSize: 15, color: Color(0xffafafaf)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xffefefef),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "생년",
                            style: TextStyle(
                                color: Color(0xffafafaf), fontSize: 15),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0xffafafaf),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xffefefef),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "월",
                            style: TextStyle(
                                color: Color(0xffafafaf), fontSize: 15),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0xffafafaf),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xffefefef),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "일",
                            style: TextStyle(
                                color: Color(0xffafafaf), fontSize: 15),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0xffafafaf),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                alignment: Alignment.centerLeft,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: const Color(0xffefefef),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "주소",
                    style: TextStyle(
                      color: Color(0xffafafaf),
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget _optionalProfiles() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Column(
          children: [
            const Row(
              children: [
                Text(
                  "선택정보",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff848484)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                height: 50,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: const TextField(
                    cursorColor: Colors.black87,
                    decoration: InputDecoration(
                      hintText: "한줄소개",
                      hintStyle:
                          TextStyle(color: Color(0xffafafaf), fontSize: 15),
                      fillColor: Color(0xffefefef),
                      filled: true,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xffefefef),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "신장",
                        style: TextStyle(
                          color: Color(0xffafafaf),
                          fontSize: 15,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "170cm",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0xffafafaf),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );

  Widget _createProfileButton() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: ThemeColor.fontColor,
              borderRadius: BorderRadius.circular(12.0)),
          child: const Text(
            "프로필 생성",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      );
}
