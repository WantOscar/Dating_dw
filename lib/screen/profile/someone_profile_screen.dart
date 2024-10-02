import 'package:dating/Widget/profile/user_profile_widget.dart';
import 'package:dating/controller/chat_controller.dart';
import 'package:dating/controller/member_block_controller.dart';
import 'package:dating/controller/user_controller.dart';
import 'package:dating/data/model/user.dart';
import 'package:dating/style/constant.dart';
import 'package:dating/style/icon_shape.dart';
import 'package:dating/widget/common/chat_send_button.dart';
import 'package:dating/widget/common/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SomeoneProfileScreen extends StatefulWidget {
  final User user;
  const SomeoneProfileScreen({super.key, required this.user});

  @override
  State<SomeoneProfileScreen> createState() => _SomeoneProfileScreenState();
}

class _SomeoneProfileScreenState extends State<SomeoneProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: _fabs(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _appbar(),
            _profile(),
            // _personality(),
            // _interesting(),
            // _idealType(),
            // _storyHeader(),
            // _story(),
          ],
        ),
      ),
    );
  }

  /// 커스텀 앱바를 제작
  /// 앱바 우측 아이콘을 누르면
  /// 사용자는 상대방을 차단/취소 가능.
  Widget _appbar() {
    return SliverAppBar(
      elevation: 0.0,
      floating: true,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          icon: IconShape.iconClose,
          onPressed: () {
            Get.back();
          },
        ),
      ),
      backgroundColor: Get.theme.colorScheme.secondary,
      centerTitle: true,
      title: Text(
        "상대 프로필",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: ThemeColor.fontColor,
        ),
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
                              onTap: () async {
                                await MemberBlockController.to
                                    .memberBlock(widget.user.id!);
                              },
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
          icon: IconShape.iconMore,
        ),
      ],
    );
  }

  /// 상대방의 프로필을 보여주는 위젯
  Widget _profile() => SliverToBoxAdapter(
        child: UserProfileWidget(
          user: widget.user,
        ),
      );

  Widget _fabs() => SizedBox(
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ChatSendButtom(
                  onPressed: () {
                    ChatController.to.makeChattingRoom(widget.user);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FavoriteButton(
                onTap: () {
                  UserController.to.postHeartAdd(widget.user.id!);
                },
              ),
            )
          ],
        ),
      );

  /// 상대방의 인적사항을 보여줌
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

  /// 상대방의 성격을 보여줌
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

  /// 상대방의 관심사를 보여줌
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

  /// 상대방의 이상형을 보여줌
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

  /// 상대방 스토리 텍스트
  // Widget _storyHeader() {
  //   return SliverToBoxAdapter(
  //     child: Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: Text(
  //         '스토리',
  //         style: TextStyle(
  //             color: ThemeColor.fontColor,
  //             fontSize: 30,
  //             fontWeight: FontWeight.bold),
  //       ),
  //     ),
  //   );
  // }

  /// 상대방 스토리를 보여줌
  // Widget _story() {
  //   return SliverGrid.builder(
  //     itemCount: 10,
  //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //         mainAxisSpacing: 2.0, crossAxisSpacing: 2.0, crossAxisCount: 3),
  //     itemBuilder: (contex, index) {
  //       return const MyPhotos();
  //     },
  //   );
  // }
}
