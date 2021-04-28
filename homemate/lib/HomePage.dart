import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homemate/AnnouncementPageList.dart';
import 'package:homemate/MyFakeAnnouncementPage.dart';
import 'ProfilesListPage.dart';
import 'ProfileConnectionsList.dart';
import 'MyAnnouncementPage.dart';

import 'NewAnnouncementPage.dart';
import 'ProfilePage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      AnnouncementPageList(),
      ProfileConnectionsList(),
      MyFakeAnnouncementPage(),
      ProfilePage(),
      ProfilesListPage()
    ];

    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 244, 244, 5),
      body: Container(
        child: pages[_index]
      ),

      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _index = index;
          });

        },
        currentIndex: _index,
        type: BottomNavigationBarType.fixed,
        fixedColor: Color.fromRGBO(133, 102, 170, 4),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.house_outlined), title: Text("Inicio")),
          BottomNavigationBarItem(
              icon: Icon(Icons.wc), title: Text("Conexões")),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_rounded), title: Text("Meu anúncio"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), title: Text("Perfil"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore), title: Text("Descobrir"),
          ),
        ],
      ),
    );
  }
}
