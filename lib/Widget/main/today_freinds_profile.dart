import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating/controller/chat_controller.dart';
import 'package:dating/controller/user_controller.dart';
import 'package:dating/data/model/user.dart';
import 'package:dating/style/constant.dart';
import 'package:dating/style/icon_shape.dart';
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
          SizedBox(
            height: 50,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    ChatController.to.makeChattingRoom(user);
                  },
                  child: Text(
                    '채팅하기',
                    style: TextStyle(
                        fontSize: 17,
                        color: ThemeColor.fontColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => UserController.to.postHeartAdd(user.id!),
            child: SizedBox(
              height: 50,
              width: 50,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: ThemeColor.fontColor,
                      shape: BoxShape.circle,
                    ),
                    child: IconShape.iconFavorite,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}
