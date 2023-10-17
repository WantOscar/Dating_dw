import 'package:dating/style/constant.dart';
import 'package:flutter/material.dart';

class TextStyling {
  static Text profileName = Text(
    Human.name,
    style: const TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );

  static Text profileAge = Text(
    Human.age,
    style: const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );

  static Text profileHeight = Text(
    Human.height,
    style: const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );

  static Text profileLocation = Text(
    Human.location,
    style: const TextStyle(
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

class Human {
  static String get name => '카리나';
  static String get age => '22세';
  static String get height => '168cm';
  static String get location => '서울 강북구';
}
