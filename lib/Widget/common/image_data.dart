import 'package:flutter/material.dart';

class ImageData extends StatelessWidget {
  final String path;
  final double width;
  const ImageData({super.key, required this.path, this.width = 70});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: width / MediaQuery.of(context).devicePixelRatio,
        child: Image.asset(
          path,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class ImagePath {
  static String get homeOn => "assets/images/bottom_nav_home_on.png";
  static String get homeOff => "assets/images/bottom_nav_home_off.png";
  static String get searchOn => "assets/images/bottom_nav_search_on.png";
  static String get searchOff => "assets/images/bottom_nav_search_off.png";
  static String get chatOn => "assets/images/bottom_nav_chat_on.png";
  static String get chatOff => "assets/images/bottom_nav_chat_off.png";
  static String get feedWriteIcon => "assets/images/feed_write_icon.png";
  static String get chatSendIcon => "assets/images/chat_send_icon.png";
  static String get arrowBackIcon => "assets/images/arrow_back_icon.png";
}
