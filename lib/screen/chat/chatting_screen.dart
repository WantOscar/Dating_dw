import 'package:dating/widget/chat/chatting_box.dart';
import 'package:dating/widget/common_header.dart';
import 'package:dating/screen/chat/chatting_in_screen.dart';
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
                ]),
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
            const SizedBox(
              height: 20,
            ),
            Column(
              children: List.generate(
                50,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: GestureDetector(
                    child: const ChattingBox(),
                    onTap: () {
                      Get.to(() => const ChattingInScreen());
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            )
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
                50,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: GestureDetector(
                    child: const ChattingBox(),
                    onTap: () {
                      Get.to(() => const ChattingInScreen());
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            )
          ],
        ),
      );
}
