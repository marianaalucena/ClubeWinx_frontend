import 'package:http/http.dart' as http;
import 'package:homemate/model/User.dart';
import 'dart:convert';

class UserAPI {
  Future<User> createUser(Map<String, String> form) async {
    final response = await http.post(
        //Uri.http('192.168.0.104:3000', '/user'),
        Uri.http('10.0.2.2:3000', '/user'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(<String, String>{
          'name': form['name'],
          'lastname': form['lastName'],
          'email': form['email'],
          'password': form['password'],
          'gender': form['gender'],
          'birthday': form['birthDate'],
          'phoneNumber': form['phoneNumber'],
          'zipCode': form['zipCode'],
          'street': form['street'],
          'number': form['number'],
          'district': form['district'],
          'complement': form['complement'],
          'city': form['city'],
          'state': form['state']
        })
    );

    if (response.statusCode == 201) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create User');
    }
  }
}
