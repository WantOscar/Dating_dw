// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecommendMemberImpl _$$RecommendMemberImplFromJson(
        Map<String, dynamic> json) =>
    _$RecommendMemberImpl(
      id: (json['id'] as num).toInt(),
      nickName: json['nickName'] as String,
      address: json['address'] as String,
      age: (json['age'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      image: json['image'] as String,
    );

Map<String, dynamic> _$$RecommendMemberImplToJson(
        _$RecommendMemberImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickName': instance.nickName,
      'address': instance.address,
      'age': instance.age,
      'height': instance.height,
      'image': instance.image,
    };
