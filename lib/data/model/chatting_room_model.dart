class ChattingRoomModel {
  int id;
  String name;
  String image;
  String lastMessage;
  String time;
  bool isRead;

  ChattingRoomModel({
    required this.id,
    required this.name,
    required this.image,
    required this.lastMessage,
    required this.time,
    this.isRead = true,
  });

  factory ChattingRoomModel.fromJson(Map<String, dynamic> json) {
    return ChattingRoomModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        lastMessage: json["lastMessage"],
        time: json["time"]);
  }

  void updateLastMessage(String message) {
    lastMessage = message;
    time = DateTime.now().toIso8601String();
    isRead = false;
  }

  void updateRead() {
    isRead = true;
  }
}
