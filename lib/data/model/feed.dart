import 'package:dating/data/model/user.dart';

class Feed {
  int? id;
  String? title;
  String? content;
  User? user;

  Feed({
    this.id,
    this.title,
    this.content,
    this.user,
  });

  factory Feed.fromJson(Map<String, dynamic> json) {
    return Feed(
        id: json['id'],
        title: json['title'],
        content: json['content'],
        user: User.fromJson(json['user']));
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
      };
}
