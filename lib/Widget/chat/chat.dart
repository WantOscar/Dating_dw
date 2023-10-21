import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  final Text text;
  const Chat({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.height * 0.055,
        decoration: const BoxDecoration(
          color: Color(0xFFF0F0F0),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(45),
            topLeft: Radius.zero,
            bottomLeft: Radius.circular(60),
            bottomRight: Radius.circular(45),
          ),
        ),
        child: Center(child: text),
      ),
    );
  }
}
