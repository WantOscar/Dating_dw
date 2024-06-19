// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_fan_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyFanMemberImpl _$$MyFanMemberImplFromJson(Map<String, dynamic> json) =>
    _$MyFanMemberImpl(
      id: (json['id'] as num).toInt(),
      nickName: json['nickName'] as String,
      age: (json['age'] as num).toInt(),
    );

Map<String, dynamic> _$$MyFanMemberImplToJson(_$MyFanMemberImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickName': instance.nickName,
      'age': instance.age,
    };
