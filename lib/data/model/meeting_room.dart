import 'package:freezed_annotation/freezed_annotation.dart';

part 'meeting_room.freezed.dart';
part 'meeting_room.g.dart';

@freezed
class MeetingRoom with _$MeetingRoom {
  factory MeetingRoom(
      {required String roomName,
      required int allCount,
      required String roomCategory,
      required String ageCategory,
      required String location}) = _MeetingRoom;

  factory MeetingRoom.fromJson(Map<String, dynamic> json) =>
      _$MeetingRoomFromJson(json);
}
