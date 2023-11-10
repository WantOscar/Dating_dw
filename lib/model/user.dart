class User {
  String name;
  String comment;
  String gender;
  String residence;
  int age;
  int height;
  String image;
  String personalInfo;
  String mbti;
  String personality;
  String interest;
  String likePersonality;

  User({
    this.name = "",
    this.comment = "",
    this.gender = "",
    this.residence = "",
    this.age = 0,
    this.height = 0,
    this.image = "",
    this.personalInfo = "",
    this.mbti = "",
    this.personality = "",
    this.interest = "",
    this.likePersonality = "",
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "comment": comment,
      "gender": gender,
      "residence": residence,
      "age": age,
      "height": height,
      "image": image,
      "personalInfo": personalInfo,
      "mbti": mbti,
      "personality": personality,
      "interest": interest,
      "likePersonality": likePersonality,
    };
  }
}
