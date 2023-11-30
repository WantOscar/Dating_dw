import 'package:dating/style/constant.dart';
import 'package:flutter/material.dart';

class CommonHeader extends StatelessWidget implements PreferredSizeWidget {
  const CommonHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Padding(
        padding: EdgeInsets.all(12.0),
        child: Text(
          '오늘의 과팅❤️‍🔥',
          style: TextStyle(
              fontSize: 20, color: fontColor, fontWeight: FontWeight.bold),
        ),
      ),
      leadingWidth: 200,
      backgroundColor: Colors.white,
      elevation: 0,
      actions: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Icon(
            Icons.tune,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
