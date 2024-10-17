import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating/controller/chat_controller.dart';
import 'package:dating/controller/user_controller.dart';
import 'package:dating/data/model/user.dart';
import 'package:dating/widget/common/chat_send_button.dart';
import 'package:dating/widget/common/favorite_button.dart';

import 'package:flutter/material.dart';

class TodayFriendsProfile extends StatelessWidget {
  final User user;
  const TodayFriendsProfile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Stack(
        children: [
          /// 오늘의 추천인 사진
          _thumNail(),

          /// 추천인과 채팅하기
          Positioned(
            bottom: 10,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _userName(),
                _address(),
                _options(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _thumNail() => SizedBox(
        height: 400,
        width: double.infinity,
        child: CachedNetworkImage(
          imageUrl: user.image!,
          fit: BoxFit.cover,
        ),
      );

  Widget _userName() => Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            user.nickName!,
            style: const TextStyle(
                fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Text(
              user.age.toString(),
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
      );

  Widget _address() => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          children: [
            const Icon(Icons.location_on, color: Colors.white, size: 20),
            Text(
              user.address!,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      );

  Widget _options() => Row(
        children: [
          ChatSendButtom(
            onPressed: () {
              ChatController.to.makeChattingRoom(user, ChatType.dm);
            },
          ),
          FavoriteButton(onTap: () {
            UserController.to.postHeartAdd(user.id!);
          })
        ],
      );
}
