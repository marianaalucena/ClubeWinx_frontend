import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homemate/HomePage.dart';
import 'package:homemate/NewAnnouncementPage.dart';
import 'package:homemate/model/Announcement.dart';

import 'ProfileConnectionsList.dart';
import 'ProfilePage.dart';
import 'ProfilesListPage.dart';

class MyAnnouncementPage extends StatefulWidget {
  Announcement announcement;

  MyAnnouncementPage({this.announcement});

  @override
  _MyAnnouncementPageState createState() => _MyAnnouncementPageState();
}

class _MyAnnouncementPageState extends State<MyAnnouncementPage> {
  int index = 0;
  String url = "https://www.decorfacil.com/wp-content/uploads/2017/03/20171011fachada-casa-simples-pequena-99-960x600.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            icon: Icon(Icons.edit_outlined),
            onPressed: (){
              Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) => NewAnnouncementPage())
              );
            },
          ),
        ],
        backgroundColor: Color.fromRGBO(133, 102, 170, 4),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                margin: new EdgeInsets.only(bottom: 20),
                child: new Material(
                  elevation: 4.0,
                  borderRadius: new BorderRadius.circular(6.0),
                  child: _getImageNetwork(url),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(19),
              child: Column(
                children: <Widget>[
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: <Widget>[
                          Text("R\$ ", style: TextStyle(fontSize: 30),),
                          Text(widget.announcement.value, style: TextStyle(fontSize: 30),)
                        ],
                      ),
                  ),
                  Divider(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child:  Text("Descrição", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(widget.announcement.description, style: TextStyle(fontSize: 17),)
                  ),
                  Divider(
                    height: 50,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child:  Text("Número de moradores", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(widget.announcement.residents, style: TextStyle(fontSize: 17),)
                  ),
                  Divider(
                    height: 50,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: _include(),
                   ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: <Widget>[
                          _includeWater(),
                          SizedBox(
                            height: 8,
                          ),
                          _includeEnergy(),
                          SizedBox(
                            height: 8,
                          ),
                          _includeInternet(),

                        ],
                      ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
            case 4:  Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilesListPage()),
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
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            title: Text("Descobrir"),

          ),
        ],
      ),
    );
  }

  Widget _getImageNetwork(url){

    return new Container(
        height: 200.0,
        child: new Image.network(
            url,
            fit: BoxFit.cover)
    );

  }

  _includeEnergy(){
    if(widget.announcement.energy){
      return Text("Energia", style: TextStyle(fontSize: 17),);
    } else{
      return Text("");
    }
  }

  _includeWater(){
    if(widget.announcement.water){
      return Text("Água", style: TextStyle(fontSize: 17),);
    } else{
      return Text("");
    }
  }

  _includeInternet(){
    if(widget.announcement.internet){
      return Text("Internet", style: TextStyle(fontSize: 17),);
    } else{
      return Text("");
    }
  }
  _include(){
    if(widget.announcement.internet || widget.announcement.water || widget.announcement.energy){
      return Text("Está incluso no valor", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),);
    }


}
}
