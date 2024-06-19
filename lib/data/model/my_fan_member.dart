import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_fan_member.freezed.dart';
part 'my_fan_member.g.dart';

@freezed
class MyFanMember with _$MyFanMember {
  factory MyFanMember({
    required int id,
    required String nickName,
    required int age,
  }) = _MyFanMember;

  factory MyFanMember.fromJson(Map<String, dynamic> json) =>
      _$MyFanMemberFromJson(json);
}
