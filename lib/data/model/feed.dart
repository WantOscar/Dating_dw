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
      user: User.fromJson(json['user']),
      createAt: json['createAt'],
      nickName: json['nickName'],
    );
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
        "createAt": createAt,
      };
}
