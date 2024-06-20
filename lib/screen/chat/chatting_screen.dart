import 'package:dating/Widget/chat/chatting_box.dart';
import 'package:dating/controller/chat_controller.dart';
import 'package:dating/controller/chatting_room_controller.dart';
import 'package:dating/screen/chat/chatting_room_screen.dart';
import 'package:dating/style/constant.dart';
import 'package:dating/widget/common/cammit_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChattingScreen extends StatefulWidget {
  const ChattingScreen({super.key});

  @override
  State<ChattingScreen> createState() => _ChattingScreenState();
}

class _ChattingScreenState extends State<ChattingScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tab;

  @override
  void initState() {
    super.initState();
    _tab = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tab.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height) * 2,
        child: CammitAppBar(
          title: "채팅",
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(65),
            child: SizedBox(
              height: AppBar().preferredSize.height,
              width: double.infinity,
              child: TabBar(
                labelStyle: const TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.black),
                labelColor: Colors.black,
                indicatorColor: ThemeColor.fontColor,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 1.0,
                controller: _tab,
                tabs: const [
                  Tab(
                    text: "단톡",
                  ),
                  Tab(
                    text: "1:1",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tab,
        children: [
          _multiChat(),
          _personalChat(),
        ],
      ),
    );
  }

  /// 단체 채팅방 목록을 보여주는 위젯
  Widget _multiChat() => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 70),
          child: Column(
            children: [
              const SizedBox(height: 20),
              GetX<ChatController>(builder: (controller) {
                return Column(
                  children: List.generate(
                    controller.chattings.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: GestureDetector(
                        child: ChattingBox(
                          chat: controller.chattings[index],
                        ),
                        onTap: () {
                          Get.to(
                              () => ChattingRoom(
                                    notMyProfile:
                                        controller.chattings[index].image,
                                  ), binding: BindingsBuilder(() {
                            Get.put(ChattingRoomController(
                                chatRoomId: controller.chattings[index].id,
                                targetName: controller.chattings[index].name));
                          }));
                        },
                      ),
                    ),
                  ),
                );
              }),
              const SizedBox(height: 80),
            ],
          ),
        ),
      );

  /// 개인 채팅방 목록을 보여주는 위젯.
  Widget _personalChat() => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 70),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              GetX<ChatController>(builder: (controller) {
                return Column(
                  children: List.generate(
                    controller.chattings.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: GestureDetector(
                        child: ChattingBox(
                          chat: controller.chattings[index],
                        ),
                        onTap: () {
                          Get.to(
                              () => ChattingRoom(
                                    notMyProfile:
                                        controller.chattings[index].image,
                                  ), binding: BindingsBuilder(() {
                            Get.put(ChattingRoomController(
                                chatRoomId: controller.chattings[index].id,
                                targetName: controller.chattings[index].name));
                          }));
                        },
                      ),
                    ),
                  ),
                );
              }),
              const SizedBox(height: 80),
            ],
          ),
        ),
      );
}
