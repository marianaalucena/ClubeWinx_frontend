import 'package:flutter/material.dart';

import 'HomePage.dart';

class MyFakeAnnouncementPage extends StatefulWidget {
  @override
  _MyFakeAnnouncementPageState createState() => _MyFakeAnnouncementPageState();
}

class _MyFakeAnnouncementPageState extends State<MyFakeAnnouncementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(133, 102, 170, 4),
        title: Text("Meu Anúncio"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage())
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
        ],
      ),
      backgroundColor: Color.fromRGBO(244, 244, 244, 5),
    );
  }
}
