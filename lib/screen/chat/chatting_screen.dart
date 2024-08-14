import 'package:dating/screen/chat/dm_chat_screen.dart';
import 'package:dating/screen/chat/multi_chat_screen.dart';
import 'package:dating/style/constant.dart';
import 'package:dating/widget/common/cammit_app_bar.dart';
import 'package:flutter/material.dart';

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
      appBar: _appBar(),
      body: TabBarView(
        controller: _tab,
        children: [
          _personalChat(),
          _multiChat(),
        ],
      ),
    );
  }

  /// 단체 채팅방 목록을 보여주는 위젯
  Widget _multiChat() => const MultiChatScreen();

  /// 개인 채팅방 목록을 보여주는 위젯.
  Widget _personalChat() => const DmChatScreen();

  PreferredSizeWidget _appBar() => PreferredSize(
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
                    text: "1:1",
                  ),
                  Tab(
                    text: "미팅",
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
