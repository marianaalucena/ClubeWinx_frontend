import 'dart:convert';

import 'package:homemate/LoginPage.dart';
import 'package:homemate/model/Announcement.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AnnouncementAPI{

  static Future<Announcement> addAnnouncement(String image, String description, String residents, String value, bool water, bool energy, bool internet) async {

    //URL da API
    var response = await http.post(
        Uri.http('192.168.0.104:3000', '/auth/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(<String, String>{
          "image" : image,
          "description" : description,
          "residents" : residents,
          "value" : value,
    //      "water" : water,
    //      "energy" : energy,
     //     "internet" : internet
        })

    );

    var announcement;
    var prefs = await SharedPreferences.getInstance();

    print('Response status: ${response.statusCode}'); //200 - ok

    Map mapResponse = json.decode(response.body);

    if(response.statusCode == 200){
      announcement = Announcement.fromJson(mapResponse);
      prefs.setString("token", mapResponse["token"]);  //persistindo o valor do token
    } else {
      announcement = null;
    }

    return announcement;

    }

}