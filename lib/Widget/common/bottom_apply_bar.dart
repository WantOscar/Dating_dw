import 'package:dating/style/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomApplyBar extends StatelessWidget {
  final String text;
  final Function onTap;
  const BottomApplyBar({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final width = Get.size.width;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: List.generate(
            10,
            (index) => Colors.white.withOpacity(0.1 * index),
          ),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          width: width,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: ThemeColor.fontColor,
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
