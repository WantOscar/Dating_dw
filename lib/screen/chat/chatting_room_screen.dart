import 'package:dating/style/constant.dart';
import 'package:dating/widget/chat/chat_bubble.dart';
import 'package:dating/widget/chat/chatting_box.dart';
import 'package:dating/widget/icon_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChattingRoomScreen extends StatefulWidget {
  final String name;
  const ChattingRoomScreen({super.key, required this.name});

  @override
  State<ChattingRoomScreen> createState() => _ChattingRoomScreenState();
}

class _ChattingRoomScreenState extends State<ChattingRoomScreen> {
  final List<String> chat = [];

  late TextEditingController _chatController;

  @override
  void initState() {
    _chatController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: Get.back,
            child: Icon(
              Icons.arrow_back,
              color: ThemeColor.fontColor,
            ),
          ),
          title: Text(
            widget.name,
            style: TextStyle(
                color: ThemeColor.fontColor, fontWeight: FontWeight.bold),
          ),
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          child: Column(
            children: [
              _chat(),
              _bottom(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _chat() => Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(
                chat.length,
                (index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 12.0),
                      child: Row(
                        children: [
                          ChatBubble(msg: chat[index]),
                        ],
                      ),
                    )),
          ),
        ),
      );

  Widget _bottom() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.camera_alt,
                color: Color(0xff1d1d1d1),
                size: 30,
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: TextField(
                  controller: _chatController,
                  style: const TextStyle(fontSize: 15, color: Colors.black45),
                  cursorColor: const Color(0xff3e3e3e3),
                  decoration: InputDecoration(
                      suffixIcon: InkWell(
                        highlightColor: Colors.black45,
                        borderRadius: BorderRadius.circular(100.0),
                        onTap: () {
                          setState(() {
                            chat.add(_chatController.value.text.toString());
                            _chatController.clear();
                          });
                        },
                        child: const Icon(
                          Icons.send,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: const Color(0xff3e3e3e3)),
                ),
              ),
            ))
          ],
        ),
      );
}
