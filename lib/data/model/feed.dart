import 'package:dating/data/model/user.dart';

class Feed {
  int? id;
  String? title;
  String? content;
  User? user;
  DateTime? createAt;
  String? nickName;

  Feed({
    this.id,
    this.title,
    this.content,
    this.user,
    this.createAt,
    this.nickName,
  });

  factory Feed.fromJson(Map<String, dynamic> json) {
    return Feed(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      user: (json['user'] != null) ? User.fromJson(json['user']) : null,
      createAt: json['createAt'],
      nickName: json['nickName'] ?? null,
    );
  }

  factory Feed.fromMyFeed(Map<String, dynamic> json, User user) {
    return Feed(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      user: user,
      createAt: json['createAt'],
      nickName: user.nickName!,
    );
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
        "createAt": createAt,
        "id": id,
      };
}
