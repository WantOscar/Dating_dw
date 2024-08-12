class User {
  String? nickName;
  String? description;
  String? birthDay;
  String? address;
  String? gender;
  int? age;
  int? height;
  List<String>? images;
  String? image;
  String? personalInfo;
  String? personality;
  String? interest;
  String? likePersonality;
  User({
    this.nickName,
    this.description,
    this.birthDay,
    this.address,
    this.gender,
    this.age,
    this.height,
    this.images,
    this.image,
    this.personalInfo,
    this.personality,
    this.interest,
    this.likePersonality,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        nickName: json["nickName"],
        description: json["description"],
        birthDay: json["birthDay"],
        address: json["address"],
        gender: json["gender"],
        age: json["age"],
        height: json["height"],
        images: List<String>.from(json["images"] ?? []),
        image: json["image"],
        personalInfo: json["personalInfo"],
        personality: json["personality"],
        interest: json["interest"],
        likePersonality: json["likePersonality"]);
  }

  Map<String, dynamic> toJson() => {
        "nickName": nickName,
        "description": description,
        "birthDay": birthDay,
        "address": address,
        "gender": gender,
        "age": age,
        "height": height,
        "images": images,
        "image": image,
        "personalInfo": personalInfo,
        "personality": personality,
        "interest": interest,
        "likePersonality": likePersonality
      };
}
