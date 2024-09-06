class Feed {
  String? nickName;
  String? address;
  String? title;
  String? description;
  int? age;
  int? height;
  int? memberId;
  int? id;

  Feed({
    this.nickName,
    this.address,
    this.title,
    this.description,
    this.age,
    this.height,
    this.memberId,
    this.id,
  });

  factory Feed.fromJson(Map<String, dynamic> json) {
    return Feed(
      nickName: json['nickname'],
      address: json['address'],
      title: json['title'],
      description: json['discription'],
      age: json['age'],
      height: json['height'],
      memberId: json['memberId'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'description': description};
  }
}
