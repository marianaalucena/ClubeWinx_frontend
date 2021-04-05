import 'package:flutter/material.dart';

class User {
  final String name;
  final String email;
  final String password;
  final String gender;
  final String birthDate;
  final String phoneNumber;
  final String cep;
  final String street;
  final String number;
  final String neighborhood;
  final String complement;
  final String city;
  final String state;

  User({@required this.name, @required this.email, @required this.password, this.gender, @required this.birthDate, this.phoneNumber,
    this.cep, @required this.street, this.number, @required this.neighborhood, this.complement, @required this.city, @required this.state});

  factory User.fromJson(Map<String, String> json) {
    return User(
      name: json['name'],
      email: json['email'],
      gender: json['gender'],
      password: json['password'],
      birthDate: json['birthDate'],
      phoneNumber: json['phoneNumber'],
      cep: json['cep'],
      street: json['street'],
      number: json['number'],
      neighborhood: json['neighborhood'],
      complement: json['complement'],
      city: json['city'],
      state: json['state']
    );
  }
}