import 'package:dating/style/constant.dart';
import 'package:flutter/material.dart';

class ChatSendButtom extends StatelessWidget {
  final void Function()? onPressed;
  const ChatSendButtom({super.key, this.onPressed})
      : assert(onPressed != null, "액션 함수를 지정하세요!");

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            onPressed: onPressed,
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
    );
  }
}
