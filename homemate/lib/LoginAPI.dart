import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'model/UserLogin.dart';

class LoginAPI{

  static Future<UserLogin> login(String email, String password) async {
    //URL da API
    var response = await http.post(
      Uri.http('192.168.0.104:3000', '/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(<String, String>{
        "email": email,
        "password": password
      })

    );

    var userLogin;
    var prefs = await SharedPreferences.getInstance();

    print('Response status: ${response.statusCode}'); //200 - ok

    Map mapResponse = json.decode(response.body);

    if(response.statusCode == 200){
      userLogin = UserLogin.fromJson(mapResponse);
      prefs.setString("token", mapResponse["token"]);  //persistindo o valor do token
    } else {
      userLogin = null;
    }

    return userLogin;

  }
}