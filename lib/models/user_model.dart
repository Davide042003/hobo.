import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hobo_test/widgets/exports/base_export.dart';

class UserModel {
  final String uid;
  final String username;
  final String email;
  final String name;
  final String profilePic;
  final bool guide;
  final Timestamp timestamp;

  UserModel({
    this.username,
    this.email,
    this.name,
    this.profilePic,
    this.uid,
    this.guide,
    this.timestamp,
  });

  factory UserModel.fromJson(Map<dynamic, dynamic> json) {
    return UserModel(
      username: json['username'],
      email: json['email'],
      name: json['name'],
      profilePic: json['profilePic'],
      uid: json['uid'],
      guide: json['guide'],
      timestamp: json['timestamp'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'name': name,
      'profilePic': profilePic,
      'uid': uid,
      'guide': guide,
      'timestamp': timestamp
    };
  }
}
