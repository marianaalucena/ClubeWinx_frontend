import 'package:http/http.dart' as http;
import 'package:homemate/model/User.dart';
import 'dart:convert';

class ProfileAPI {
  Future<User> showUser() async {
    final response = await http.get(
        Uri.http('177.37.145.136:3000', '/user'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },

    );
    print(response.body);

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));

    } else {
      throw Exception('Failed to edit User');
    }
  }

}
