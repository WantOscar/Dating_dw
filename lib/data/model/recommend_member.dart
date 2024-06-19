import 'package:freezed_annotation/freezed_annotation.dart';

part 'recommend_member.freezed.dart';
part 'recommend_member.g.dart';

@freezed
class RecommendMember with _$RecommendMember {
  factory RecommendMember({
    required int id,
    required String nickName,
    required String address,
    required int age,
    required int height,
    required String image,
  }) = _RecommendMember;

  factory RecommendMember.fromJson(Map<String, dynamic> json) =>
      _$RecommendMemberFromJson(json);
}
