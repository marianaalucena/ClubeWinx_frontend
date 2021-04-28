import 'dart:io';

import 'package:homemate/HomePage.dart';

import 'Profile_helper.dart';
import 'ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'ProfilesListPage.dart';
import 'MyAnnouncementPage.dart';

enum OrderOptions {orderaz, orderza}

class ProfileConnectionsList extends StatefulWidget {
  @override
  _ProfileConnectionsListState createState() => _ProfileConnectionsListState();
}

class _ProfileConnectionsListState extends State<ProfileConnectionsList> {

  ProfileHelper helper = ProfileHelper();

  List<Profile> profiles = List();
  int index = 0;

  @override
  void initState() {
    super.initState();

    _getAllProfiles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(133, 102, 170, 4),
        title: Text("Minhas Conexões"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     _showProfilePage();
      //   },
      //   child: Icon(Icons.add),
      //   backgroundColor: Color.fromRGBO(133, 102, 170, 4),
      // ),
      body: ListView.builder(
          padding: EdgeInsets.all(10.0),
          itemCount: profiles.length,
          itemBuilder: (context, index) {
            return _profileCard(context, index);
          }
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   onTap: (int index) {
      //     setState(() {
      //       this.index = index;
      //     });
      //     switch (index){
      //       case 0:  Navigator.of(context).pushNamed('/medical centre');
      //       break;
      //       case 1:  Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => ProfileConnectionsList()),
      //       );
      //       break;
      //       case 2:
      //         break;
      //       case 3:  Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => ProfilePage()),
      //       );
      //       break;
      //       case 4:  Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => ProfilesListPage()),
      //       );
      //       break;
      //
      //     }
      //
      //   },
      //   currentIndex: index,
      //   type: BottomNavigationBarType.fixed,
      //   fixedColor: Color.fromRGBO(133, 102, 170, 4),
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.house_outlined), title: Text("Inicio")),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.wc), title: Text("Conexões")),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.assignment_rounded), title: Text("Meu anúncio"),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person), title: Text("Perfil"),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.explore), title: Text("Descobrir"),
      //     ),
      //   ],
      // ),
    );
  }

  Widget _profileCard(BuildContext context, int index){
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: profiles[index].img != null ?
                      FileImage(File(profiles[index].img)) :
                      AssetImage("images/person.png"),
                      fit: BoxFit.cover
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(profiles[index].name ?? "",
                      style: TextStyle(fontSize: 22.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(profiles[index].email ?? "",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Text(profiles[index].phone ?? "",
                      style: TextStyle(fontSize: 18.0),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      onTap: (){
        _showOptions(context, index);
      },
    );
  }

  void _showOptions(BuildContext context, int index){
    showModalBottomSheet(
        context: context,
        builder: (context){
          return BottomSheet(
            onClosing: (){},
            builder: (context){
              return Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                        child: Text("Ligar",
                          style: TextStyle(color: Colors.red, fontSize: 20.0),
                        ),
                        onPressed: (){
                          launch("tel:${profiles[index].phone}");
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                        child: Text("Editar",
                          style: TextStyle(color: Colors.red, fontSize: 20.0),
                        ),
                        onPressed: (){
                          Navigator.pop(context);
                          _showProfilePage(profile: profiles[index]);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                        child: Text("Excluir",
                          style: TextStyle(color: Colors.red, fontSize: 20.0),
                        ),
                        onPressed: (){
                          helper.deleteProfile(profiles[index].id);
                          setState(() {
                            profiles.removeAt(index);
                            Navigator.pop(context);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
    );
  }

  void _showProfilePage({Profile profile}) async {
    final recProfile = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => ProfilePage(profile: profile,))
    );
    if(recProfile != null){
      if(profile != null){
        await helper.updateProfile(recProfile);
      } else {
        await helper.saveProfile(recProfile);
      }
      _getAllProfiles();
    }
  }

  void _getAllProfiles(){
    helper.getAllProfiles().then((list){
      setState(() {
        profiles = list;
      });
    });
  }

  void _orderList(OrderOptions result){
    switch(result){
      case OrderOptions.orderaz:
        profiles.sort((a, b) {
          return a.name.toLowerCase().compareTo(b.name.toLowerCase());
        });
        break;
      case OrderOptions.orderza:
        profiles.sort((a, b) {
          return b.name.toLowerCase().compareTo(a.name.toLowerCase());
        });
        break;
    }
    setState(() {

    });
  }

}