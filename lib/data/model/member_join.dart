class MemberJoin {
  String? email;
  String? password;

  MemberJoin({this.email, this.password});

  Map<String, dynamic> toJson() => {"email": email, "password": password};

  set setEmail(String email) {
    this.email = email;
  }

  set setPassword(String password) {
    this.password = password;
  }
}
