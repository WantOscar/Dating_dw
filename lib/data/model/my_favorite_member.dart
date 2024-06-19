import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_favorite_member.freezed.dart';
part 'my_favorite_member.g.dart';

@freezed
class MyFavoriteMember with _$MyFavoriteMember {
  factory MyFavoriteMember({
    required int id,
    required String nickName,
    required int age,
  }) = _MyFavoriteMember;

  factory MyFavoriteMember.fromJson(Map<String, dynamic> json) =>
      _$MyFavoriteMemberFromJson(json);
}
