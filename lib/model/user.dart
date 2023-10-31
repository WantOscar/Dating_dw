class User {
  late final String username;
  late final String password;

  User({required this.username, required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(username: json['username'], password: json['password']);
  }

  Map<String, dynamic> toJson() => {'username': username, 'password': password};
}
