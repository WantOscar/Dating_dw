import 'package:dating/style/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CammitAppBar extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  final bool showCloseButton;
  final PreferredSizeWidget? bottom;
  const CammitAppBar(
      {super.key,
      required this.title,
      this.actions,
      this.showCloseButton = false,
      this.bottom});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: (showCloseButton)
          ? GestureDetector(
              onTap: Get.back,
              child: Icon(
                Icons.close,
                color: ThemeColor.fontColor,
                size: 25,
              ),
            )
          : null,
      title: Text(
        title,
        style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: ThemeColor.fontColor),
      ),
      centerTitle: (showCloseButton),
      actions: (actions != null)
          ? List.generate(
              actions!.length,
              (index) => Padding(
                    padding: EdgeInsets.all(12.0),
                    child: actions![index],
                  ))
          : null,
      bottom: bottom,
    );
  }
}
