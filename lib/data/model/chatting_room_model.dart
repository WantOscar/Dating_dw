class ChattingRoomModel {
  final int id;
  final String name;
  final String image;
  final String lastMessage;
  final String time;

  ChattingRoomModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.lastMessage,
      required this.time});

  factory ChattingRoomModel.fromJson(Map<String, dynamic> json) {
    return ChattingRoomModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        lastMessage: json["lastMessage"],
        time: json["time"]);
  }
}
