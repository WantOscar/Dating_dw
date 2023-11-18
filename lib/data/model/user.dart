import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  factory User({
    required String name,
    required String comment,
    required String gender,
    required String residence,
    required int age,
    required int height,
    required String image,
    required String personalInfo,
    required String mbti,
    required String personality,
    required String interest,
    required String likePersonality,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
