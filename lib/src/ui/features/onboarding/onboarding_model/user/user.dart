import 'dart:convert';

User userFromJson(String str) =>
    User.fromJson(json.decode(str) as Map<String, dynamic>);

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.id,
    required this.fullName,
    required this.email,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as String,
        email: json['email'] as String,
        fullName: json['fullName'] as String,
        password: json['password'] != null ? json['password'] as String : null,
      );

  String id;
  String email;
  String fullName;
  String? password;

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullName': fullName,
        'email': email,
        'password': password,
      };
}
