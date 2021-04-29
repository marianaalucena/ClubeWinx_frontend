import 'package:flutter/material.dart';

class UserProfile {
  final String phoneNumber;
  final String email;
  final String picture;
  final String name;
  final String lastname;
  final String birthday;
  final String gender;
  final String socialMedia;
  final String description;
  final bool privateConnection;
  //tag


  UserProfile({this.phoneNumber, this.email, this.picture, this.name,  this.lastname, this.birthday,this.gender, this.socialMedia, this.description, this.privateConnection, }); //acrescentar tag

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
        phoneNumber: json['phoneNumber'],
        email: json['email'],
        picture: json['picture'],
        name: json['name'],
        lastname: json['lastname'],
        birthday: json['birthday'],
        gender: json['gender'],
        socialMedia: json['socialMedia'],
        description: json['description'],
        privateConnection: json['privateConnection'],
        //tag
   );
  }
}