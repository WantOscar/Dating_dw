import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  factory User({
    String? nickName,
    String? description,
    String? birthDay,
    String? address,
    String? gender,
    int? age,
    int? height,
    List? images,
    String? image,
    String? personalInfo,
    String? personality,
    String? interest,
    String? likePersonality,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
