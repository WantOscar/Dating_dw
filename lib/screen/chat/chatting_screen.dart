import 'package:dating/controller/feed_controller.dart';
import 'package:dating/widget/chat/chatting_box.dart';
import 'package:dating/widget/common_header.dart';
import 'package:dating/screen/chat/chatting_room_screen.dart';
import 'package:dating/style/constant.dart';
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
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text(
            "채팅",
            style: TextStyle(
                fontSize: 25,
                color: ThemeColor.fontColor,
                fontWeight: FontWeight.bold),
          ),
        ),
        leadingWidth: 200,
        backgroundColor: Colors.white,
        elevation: 0,
        // actions: const [Icon(Icons.more_vert)],
        toolbarHeight: 65,
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
      body: TabBarView(
        controller: _tab,
        children: [
          _multiChat(),
          _personalChat(),
        ],
      ),
    );
  }

  Widget _multiChat() => SingleChildScrollView(
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
                      Get.to(() => const ChattingRoom(
                            chatRoomId: "1",
                          ));
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      );

  Widget _personalChat() => SingleChildScrollView(
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
                      Get.to(() => const ChattingRoom(
                            chatRoomId: "1",
                          ));
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 80),
          ],
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
