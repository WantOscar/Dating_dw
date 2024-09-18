class FCMSend {
  String targetName;
  String title;
  String body;
  int chatRoomNo;

  FCMSend({
    required this.targetName,
    required this.title,
    required this.body,
    required this.chatRoomNo,
  });

  Map<String, dynamic> toJson() => {
        "targetName": targetName,
        "title": title,
        "body": body,
        "chatRoomNo": chatRoomNo,
      };
}
