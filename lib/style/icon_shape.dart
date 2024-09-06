import 'package:dating/style/constant.dart';
import 'package:flutter/material.dart';

class IconShape {
  /// 사용자의 나이와 키 앞에 보여주는
  /// 사람 아이콘
  static const iconPerson = Icon(Icons.person, size: 20, color: Colors.white);

  /// 사용자의 한 줄 소개를 보여주는
  /// 메시지 아이콘
  static const iconMessasge =
      Icon(Icons.message, size: 17, color: Colors.white);

  /// 사용자의 거주지 or 현재 위치 앞에 보여주는
  /// 위치 아이콘
  static const iconLocationOn =
      Icon(Icons.location_on, size: 18, color: Colors.white);

  /// 설정 아이콘
  static Icon get iconSettings =>
      Icon(Icons.settings, color: ThemeColor.fontColor, size: 30);

  /// 성별이 남자임을 보여주는 아이콘
  static const iconMale = Icon(Icons.male, size: 20, color: Colors.blue);

  /// 성별이 여자임을 보여주는 아이콘
  static const iconFemale = Icon(Icons.female, size: 20, color: Colors.red);

  /// 뒤로 가기 아이콘
  static const iconArrowBackIos =
      Icon(Icons.arrow_back_ios, color: Colors.pink);

  /// 상대방을 차단할 것인지 선택할 수 있는 아이콘
  static const iconMore = Icon(Icons.more_horiz, size: 30, color: Colors.black);

  /// 다음 화면으로 넘어가는 아이콘
  static Icon get iconArrowForward =>
      Icon(Icons.arrow_forward_ios, size: 25, color: ThemeColor.iconColor);

  /// 좋아요를 누를 수 있는 아이콘
  static Icon get iconFavorite =>
      const Icon(Icons.favorite, color: Colors.white, size: 25);

  /// 올린 사진이 없을 때 초기의 빈 화면을 보여주는 아이콘
  static Icon get iconNoImage =>
      const Icon(Icons.image_not_supported, color: Colors.white);

  /// 현재 화면을 닫는 아이콘
  static Icon get iconClose =>
      Icon(Icons.close, size: 25, color: ThemeColor.fontColor);

  /// 다음 화면으로 넘어가는 아이콘
  static Icon get iconArrowGoto =>
      Icon(Icons.arrow_forward, size: 25, color: ThemeColor.fontColor);

  /// 글을 쓰는 화면으로 넘어가는 아이콘
  static Icon get iconEditNote =>
      Icon(Icons.edit_note, color: ThemeColor.fontColor, size: 30);
}
