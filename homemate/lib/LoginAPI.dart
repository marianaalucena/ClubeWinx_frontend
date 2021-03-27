import 'dart:convert';

import 'package:homemate/LoginPage.dart';
import 'package:http/http.dart' as http;

class LoginAPI{

  static Future<bool> login(String email, String password) async {
    //URL da API
    var url = 'https://example.com/whatsit/create';

    var header = {"Content-Type": "application/json"};

    Map params = {
      "email" : email,
      "senha" : password
    };
    var _body = json.encode(params);
    print("json enviado : $_body");

    var response = await http.post(url, headers: header, body: _body);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    print(await http.read('https://example.com/foobar.txt'));
    return true;
  }
}