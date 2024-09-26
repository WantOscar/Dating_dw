class ChattingRoomModel {
  int id;
  String? name;
  String? image;
  String? lastMessage;
  String? time;
  bool isRead;

  ChattingRoomModel({
    required this.id,
    this.name,
    this.image,
    this.lastMessage,
    this.time,
    required this.isRead,
  });

  factory ChattingRoomModel.fromJson(Map<String, dynamic> json) {
    return ChattingRoomModel(
      id: json["id"],
      name: json["name"],
      image: json["image"],
      lastMessage: json["lastMessage"],
      time: json["time"],
      isRead: json["isRead"],
    );
  }

  void updateLastMessage(String message) {
    lastMessage = message;
    time = DateTime.now().toIso8601String();
    isRead = false;
  }
}
