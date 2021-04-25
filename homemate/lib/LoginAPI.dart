import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:homemate/LoginPage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'model/UserLogin.dart';

class LoginAPI{

  static Future<UserLogin> login(String email, String password) async {
    //URL da API
    var url = 'https://example.com/whatsit/create';

    var header = {"Content-Type": "application/json"};

    Map params = {
      "email" : email,
      "senha" : password
    };

    var userLogin;
    var prefs = await SharedPreferences.getInstance();


    var _body = json.encode(params);
    print("json enviado : $_body");

    var response = await http.post(url, headers: header, body: _body);

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