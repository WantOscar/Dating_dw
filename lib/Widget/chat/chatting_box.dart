import 'package:dating/data/model/chatting_room_model.dart';
import 'package:dating/widget/common/image_avatar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../style/constant.dart';

class ChattingBox extends StatelessWidget {
  final ChattingRoomModel chat;
  const ChattingBox({
    super.key,
    required this.chat,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.18,
                  height: MediaQuery.of(context).size.width * 0.18,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      color: Colors.grey),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: ImageAvatar(
                      imagePath: chat.image,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chat.name,
                        style: TextStyle(
                            color: ThemeColor.font2Color,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        chat.lastMessage,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Flexible(
              child: Text(
                DateFormat.jms().format(DateTime.parse(chat.time)).toString(),
                style: TextStyle(fontSize: 12, color: ThemeColor.font2Color),
              ),
            )
          ],
        ),
      ),
    );
  }
}
