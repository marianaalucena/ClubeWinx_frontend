import 'package:http/http.dart' as http;
import 'package:homemate/model/User.dart';
import 'dart:convert';

class UserAPI {
  Future<User> createUser(Map<String, String> form) async {
    final response = await http.post(
        Uri.https('https://example.com/whatsit/create', 'users'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(<String, String>{
          'name': form['name'],
          'email': form['email'],
          'password': form['password'],
          'gender': form['gender'],
          'birthDate': form['birthDate'],
          'phoneNumber': form['phoneNumber'],
          'cep': form['cep'],
          'street': form['street'],
          'number': form['number'],
          'neighborhood': form['neighborhood'],
          'complement': form['complement'],
          'city': form['city'],
          'state': form['state']
        })
    );
    if(response.statusCode == 201) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create User');
    }
  }
}