import 'package:dating/style/constant.dart';
import 'package:flutter/material.dart';

class TextStyling {
  static const profileName = Text(
    '카리나',
    style: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );

  static const profileAge = Text(
    '22세',
    style: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );

  static const profileHeight = Text(
    '168cm',
    style: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );

  static const profileLocation = Text(
    '서울 강북구',
    style: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );

  static const profileEdit = Text(
    '프로필 편집',
    style: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );

  static const profile = Text(
    '프로필',
    style:
        TextStyle(fontSize: 25, color: fontColor, fontWeight: FontWeight.bold),
  );
}
