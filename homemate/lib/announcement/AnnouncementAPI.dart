import 'dart:convert';

import 'package:homemate/LoginPage.dart';
import 'package:http/http.dart' as http;

class AnnouncementAPI{

  static Future<bool> addAnnouncement(String image, String description, String residents, String cep, String street, String district, String city, String state, String value, bool _water, bool _energy, bool _internet) async {

    //URL da API
    var url = 'https://example.com/whatsit/create';

    var header = {"Content-Type": "application/json"};

    Map params = {
      "image" : image,
      "description" : description,
      "residents" : residents,
      "cep" : cep,
      "street" : street,
      "district" : district,
      "city" : city,
      "state" : state,
      "value" : value,
      "water" : _water,
      "energy" : _energy,
      "internet" : _internet

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