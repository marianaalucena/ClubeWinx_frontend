import 'package:flutter/material.dart';

class User {
  final String name;
  final String email;
  final String password;
  final String gender;
  final String birthDate;
  final String phoneNumber;
  final String zipCode;
  final String street;
  final String number;
  final String district;
  final String complement;
  final String city;
  final String state;

  User({@required this.name, @required this.email, @required this.password, this.gender, @required this.birthDate, this.phoneNumber,
    this.zipCode, @required this.street, this.number, @required this.district, this.complement, @required this.city, @required this.state});

  factory User.fromJson(Map<String, String> json) {
    return User(
      name: json['name'],
      email: json['email'],
      gender: json['gender'],
      password: json['password'],
      birthDate: json['birthday'],
      phoneNumber: json['phoneNumber'],
      zipCode: json['zipCode'],
      street: json['street'],
      number: json['number'],
      district: json['district'],
      complement: json['complement'],
      city: json['city'],
      state: json['state']
    );
  }
}