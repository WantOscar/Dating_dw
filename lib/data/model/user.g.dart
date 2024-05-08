// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      nickName: json['nickName'] as String?,
      description: json['description'] as String?,
      birthDay: json['birthDay'] as String?,
      address: json['address'] as String?,
      gender: json['gender'] as String?,
      age: json['age'] as int?,
      height: json['height'] as int?,
      images: json['images'] as List<dynamic>?,
      image: json['image'] as String?,
      personalInfo: json['personalInfo'] as String?,
      personality: json['personality'] as String?,
      interest: json['interest'] as String?,
      likePersonality: json['likePersonality'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'nickName': instance.nickName,
      'description': instance.description,
      'birthDay': instance.birthDay,
      'address': instance.address,
      'gender': instance.gender,
      'age': instance.age,
      'height': instance.height,
      'images': instance.images,
      'image': instance.image,
      'personalInfo': instance.personalInfo,
      'personality': instance.personality,
      'interest': instance.interest,
      'likePersonality': instance.likePersonality,
    };
