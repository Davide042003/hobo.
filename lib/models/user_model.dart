import 'package:hobo_test/widgets/exports/base_export.dart';

class UserModel {
  final String id;
  final String username;
  final String email;
  final String password;
  final bool isTourist;
  final String name;
  final String profilePic;

  UserModel({this.name, this.profilePic, this.id, this.username, this.email, this.password, this.isTourist});

  factory UserModel.fromJson(Map<dynamic, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      isTourist: json['isTourist'],
      name: json['name'],
      profilePic: json['profilePic'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'username': username,
      'email': email,
      'password': password,
      'isTourist': isTourist,
      'name': name,
      'profilePic': profilePic,
    };
  }
}
