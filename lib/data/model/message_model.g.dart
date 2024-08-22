// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageModelImpl _$$MessageModelImplFromJson(Map<String, dynamic> json) =>
    _$MessageModelImpl(
      nickName: json['nickName'] as String?,
      message: json['message'] as String?,
      messageType: json['messageType'] as String?,
      createAt: json['createAt'] as String?,
      chatRoomId: (json['chatRoomId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MessageModelImplToJson(_$MessageModelImpl instance) =>
    <String, dynamic>{
      'nickName': instance.nickName,
      'message': instance.message,
      'messageType': instance.messageType,
      'createAt': instance.createAt,
      'chatRoomId': instance.chatRoomId,
    };
