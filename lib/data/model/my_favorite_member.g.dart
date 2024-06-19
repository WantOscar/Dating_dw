// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_favorite_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyFavoriteMemberImpl _$$MyFavoriteMemberImplFromJson(
        Map<String, dynamic> json) =>
    _$MyFavoriteMemberImpl(
      id: (json['id'] as num).toInt(),
      nickName: json['nickName'] as String,
      age: (json['age'] as num).toInt(),
    );

Map<String, dynamic> _$$MyFavoriteMemberImplToJson(
        _$MyFavoriteMemberImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickName': instance.nickName,
      'age': instance.age,
    };
