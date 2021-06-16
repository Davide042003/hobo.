import 'dart:html';

class User {

  final String username;
  final String email;
  final String password;
  final String name;
  final String profilePic;
  final bool onboardingSeen;

  User({this.username, this.email, this.password, this.name, this.profilePic, this.onboardingSeen});

  factory User.fromJson(Map<dynamic, dynamic> json){
   return User(
     username: json['username'],
     email: json['email'],
     password: json['password'],
     name: json['name'],
     profilePic: json['profilePic'],
     onboardingSeen: json['onboardingSeen'],
   );
  }

  Map<dynamic, dynamic> toMap(){
    return{
      'username':username,
      'email':email,
      'password':password,
      'name':name,
      'profilePic':profilePic,
      'onboardingSeen':onboardingSeen,
    };
  }
}