import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ProfileConnectionsList.dart';
import '../ProfilePage.dart';

class MyAnnouncementPage extends StatefulWidget {
  @override
  _MyAnnouncementPageState createState() => _MyAnnouncementPageState();
}

class _MyAnnouncementPageState extends State<MyAnnouncementPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(133, 102, 170, 4),
      ),
      body: Text("Você não possui anúncios"),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            this.index = index;
          });
          switch (index){
            case 0:  Navigator.of(context).pushNamed('/medical centre');
            break;
            case 1:  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileConnectionsList()),
            );
            break;
            case 2:  Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyAnnouncementPage()),
            );
            break;
            case 3:  Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
            break;

          }

        },
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Color.fromRGBO(133, 102, 170, 4),
              icon: Icon(Icons.house_outlined), title: Text("Inicio")),
          BottomNavigationBarItem(
              icon: Icon(Icons.wc), title: Text("Conexões")),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_rounded),
            title: Text("Meu anúncio"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Perfil"),
          ),
        ],
      ),
    );
  }
}
