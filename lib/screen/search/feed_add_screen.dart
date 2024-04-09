import 'package:dating/style/icon_shape.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedAddScreen extends StatelessWidget {
  const FeedAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: IconShape.iconClose,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "새 게시물",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Center(
            child: GestureDetector(
              onTap: () {},
              child: const Text(
                "다음",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          )
        ],
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
