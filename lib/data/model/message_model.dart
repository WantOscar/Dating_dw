class MessageModel {
  final int? myId;
  final int? id;
  final String? image;
  final String? message;
  final DateTime? createAt;

  MessageModel({this.myId, this.id, this.image, this.message, this.createAt});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
        myId: json["myId"],
        id: json["id"],
        image: json["image"],
        message: json["message"],
        createAt: DateTime.parse(json["createAt"]));
  }

  static Map<String, dynamic> toJson({
    required int memberId,
    required String chatRoomId,
    required String message,
  }) {
    return {
      "messageType": "TALK",
      "memberId": memberId,
      "chatRoomId": chatRoomId,
      "message": message,
    };
  }
}
