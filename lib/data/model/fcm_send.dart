class FCMSend {
  String? targetName;
  String? title;
  String? body;

  FCMSend({
    this.targetName,
    this.title,
    this.body,
  });

  Map<String, dynamic> toJson() => {
        "targetName": targetName,
        "title": title,
        "body": body,
      };
}
