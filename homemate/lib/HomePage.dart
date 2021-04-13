import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/mariana.a.lucena/Documents/Flutter/homemate/ClubeWinx_frontend/ClubeWinx_frontend/homemate/lib/announcement/MyAnnouncementPage.dart';

import 'announcement/NewAnnouncementPage.dart';
import 'ProfilePage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 244, 244, 5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(133, 102, 170, 4),
        title: Text("Anúncios"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Center(
            heightFactor: 6,
            child: IconButton(
              iconSize: 80,
              icon: Icon(Icons.library_add_sharp, color: Color.fromRGBO(133, 102, 170, 4), ),
              onPressed: _clickButton,
            ),
          ),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            this.index = index;
          });
          switch (index){
            case 0:  Navigator.of(context).pushNamed('/medical centre');
            break;
            case 1:  Navigator.of(context).pushNamed('/medical centre');
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

  void _clickButton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewAnnouncementPage()),
    );
  }
}
