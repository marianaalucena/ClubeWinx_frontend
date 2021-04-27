import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit_outlined),
            onPressed: (){},
          ),
        ],
        backgroundColor: Color.fromRGBO(133, 102, 170, 4),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: GestureDetector(
                child: Container(
                  width: 300.0,
                  height: 300.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: NetworkImage(url),
                     // image: AssetImage("images/person.png"),
                      //  image: _image != null ?
                      // Image.file(_image) :
                      //AssetImage("images/person.png"),
                      //fit: BoxFit.cover
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Descrição: ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                        text: widget.announcement.description,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        )),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Número de moradores: ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                        text: widget.announcement.residents,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        )),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            Text("Localização", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'CEP: ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                        text: widget.announcement.cep,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Rua: ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                        text: widget.announcement.street,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Bairro: ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                        text: widget.announcement.district,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Cidade: ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                        text: widget.announcement.city,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20, bottom: 20),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Estado: ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                        text: widget.announcement.state,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        )),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            Text("Valor", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'R\$ ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                        text: widget.announcement.value,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20),
              child: Row(
                children: <Widget>[
                  Text("Inclui: ", style: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                  fontWeight: FontWeight.bold),),
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

  String _includeEnergy(){
    if(widget.announcement.energy){
      return "energia";
    }
  }

  String _includeWater(){
    if(widget.announcement.water){
      return "água";
    }
  }

  String _includeInternet(){
    if(widget.announcement.internet){
      return "internet";
    }
  }
}
