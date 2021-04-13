import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homemate/EditProfilePage.dart';

import 'LoginPage.dart';

class HomemateSplash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<HomemateSplash> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    Future.delayed(Duration(seconds: 1)).then((_){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color:  Color.fromRGBO(244, 244, 244, 4),
      child: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Home',
            style: TextStyle(color: Color.fromRGBO(133, 102, 170, 7), fontSize: 30, fontWeight: FontWeight.bold),
            children: <TextSpan>[
              TextSpan(text: 'mate', style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(142, 198, 197, 7),)),
            ],
          ),
        ),
      ),
    );
  }
}