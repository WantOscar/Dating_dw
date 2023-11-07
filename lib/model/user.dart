class User {
  final String? name;
  final String? comment;
  final String? gender;
  final String? residence;
  final int? age;
  final int? height;
  final String? image;
  final String? personalInfo;
  final String? mbti;
  final String? personality;
  final String? interest;
  final String? likePersonality;

  User(
      {required this.name,
      required this.comment,
      required this.gender,
      required this.residence,
      required this.age,
      required this.height,
      required this.image,
      required this.personalInfo,
      required this.mbti,
      required this.personality,
      required this.interest,
      required this.likePersonality});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      comment: json['comment'],
      gender: json['gender'],
      residence: json['residence'],
      age: json['age'],
      height: json['height'],
      image: json['image'],
      personalInfo: json['personalInfo'],
      mbti: json['mbti'],
      personality: json['personality'],
      interest: json['interest'],
      likePersonality: json['likePersonality'],
    );
  }
  Map<String, dynamic> toJson() => {
        'name': name,
        'comment': comment,
        'gender': gender,
        'residence': residence,
        'age': age,
        'height': height,
        'image': image,
        'personalInfo': personalInfo,
        'mbti': mbti,
        'personlity': personality,
        'interest': interest,
        'likePersonality': likePersonality,
      };
}
