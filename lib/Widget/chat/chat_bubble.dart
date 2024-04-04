import 'package:flutter/material.dart';

enum ChatType { BASICBUBBLE, MYBUBBLE }

class ChatBubble extends StatelessWidget {
  final String msg;
  final ChatType type;
  const ChatBubble(
      {super.key, required this.msg, this.type = ChatType.BASICBUBBLE});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: (type == ChatType.BASICBUBBLE)
          ? const BoxDecoration(
              color: Color(0xffe3e3e3),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(100.0),
                  bottomRight: Radius.circular(100.0),
                  bottomLeft: Radius.circular(100.0)))
          : const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100.0),
                  bottomRight: Radius.circular(100.0),
                  bottomLeft: Radius.circular(100.0))),
      alignment: Alignment.center,
      child: Text(
        msg,
        style: const TextStyle(color: Colors.black45),
      ),
    );
  }
}
