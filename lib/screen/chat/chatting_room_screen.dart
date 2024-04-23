import 'package:dating/controller/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChattingRoom extends StatefulWidget {
  final String chatRoomId;
  const ChattingRoom({super.key, required this.chatRoomId});

  @override
  State<ChattingRoom> createState() => _ChattingRoomState();
}

class _ChattingRoomState extends State<ChattingRoom> {
  late final WebSocketChannel _channel;
  late final TextEditingController _message;
  @override
  void initState() {
    super.initState();
    _channel =
        WebSocketChannel.connect(Uri.parse("ws://13.124.21.82:8082/ws/chat"));
    _message = TextEditingController();
  }

  @override
  void dispose() {
    _channel.sink.close();
    _message.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        print("메시지 전송");
        final data = {
          "messageType": "TALK",
          "memberId": "1",
          "chatRoomId": "1",
          "message": "안녕하세요!"
        };
        _channel.sink.add(data);
      }),
      body: Column(
        children: [
          TextField(
            controller: _message,
          ),
          StreamBuilder(
              stream: _channel.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data);
                } else {
                  return Container();
                }
              })
        ],
      ),
    );
  }
}
