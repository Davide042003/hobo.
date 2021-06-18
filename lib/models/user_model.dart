import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';

class User {

  final String uid;
  final String username;
  final String email;
  final String name;
  final String profilePic;
  final bool guide;
  final Timestamp timestamp;

  User({this.username, this.email, this.name, this.profilePic, this.uid, this.guide,this.timestamp, });

  factory User.fromJson(Map<dynamic, dynamic> json){
   return User(
     username: json['username'],
     email: json['email'],
     name: json['name'],
     profilePic: json['profilePic'],
     uid: json['uid'],
     guide: json['guide'],
     timestamp: json['timestamp'],
   );
  }

  Map<dynamic, dynamic> toMap(){
    return{
      'username':username,
      'email':email,
      'name':name,
      'profilePic':profilePic,
      'uid': uid,
      'guide' : guide,
      'timestamp' : timestamp
    };
  }
}