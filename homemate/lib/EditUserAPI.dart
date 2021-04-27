import 'package:http/http.dart' as http;
import 'package:homemate/model/User.dart';
import 'dart:convert';

class EditUserAPI {
  Future<User> editUser(Map<String, String> form) async {
    final response = await http.put(
        Uri.http('177.37.145.136:3000', '/user/{userId}'),
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
      throw Exception('Failed to edit User');
    }
  }
}
