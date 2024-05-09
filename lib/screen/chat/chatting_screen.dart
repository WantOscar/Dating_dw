import 'package:dating/controller/chatting_room_controller.dart';
import 'package:dating/screen/chat/chatting_room_screen.dart';
import 'package:dating/style/constant.dart';
import 'package:dating/widget/chat/chatting_box.dart';
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
  final data = List.generate(
      20,
      (index) => Chat(
          thumPath:
              'https://i.pinimg.com/474x/88/0d/b9/880db9d816b47504adc3be91439cd77e.jpg',
          name: "홍길동",
          lastChat: "안녕하세요",
          date: "9월 25일"));

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
              Column(
                children: List.generate(
                  data.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: GestureDetector(
                      child: const ChattingBox(),
                      onTap: () {
                        Get.to(() => const ChattingRoom(),
                            binding: BindingsBuilder(() {
                          Get.put(ChattingRoomController(chatRoomId: 15));
                        }));
                      },
                    ),
                  ),
                ),
              ),
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
              Column(
                children: List.generate(
                  data.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: GestureDetector(
                      child: const ChattingBox(),
                      onTap: () {
                        Get.to(() => const ChattingRoom(),
                            binding: BindingsBuilder(() {
                          Get.put(ChattingRoomController(chatRoomId: 1));
                        }));
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      );
}

class Chat {
  final String thumPath;
  final String name;
  final String lastChat;
  final String date;

  Chat({
    required this.thumPath,
    required this.name,
    required this.lastChat,
    required this.date,
  });
}
