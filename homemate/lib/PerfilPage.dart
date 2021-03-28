import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homemate/ResetSenha.dart';

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  final String url = 'https://capricho.abril.com.br/wp-content/uploads/2018/03/netflix-lancar-serie-live-action-clube-winx.jpg?quality=85&strip=info&crop=0px%2C266px%2C795px%2C541px&resize=680%2C453';
  final Color green = Color(0xFF1E8161);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 244, 244, 5),
      appBar: AppBar(
        title: Text("Perfil"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){},
        ),
        backgroundColor: Color.fromRGBO(133, 102, 170, 4),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 16),
            width: MediaQuery.of(context).size.width,
            height: 300,
            decoration: BoxDecoration(
              color: Color.fromRGBO(133, 102, 170, 4),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(32),
                bottomLeft: Radius.circular(32)
              ),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(url)
                          )
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 32),
                  child: Text('Clube Winx',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Icon(Icons.email_outlined, color: Colors.white,),
                          Text('Email',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(Icons.group, color: Colors.white,),
                          Text('Rede Social',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(Icons.phone, color: Colors.white,),
                          Text('Celular',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 20,
            padding: EdgeInsets.all(42),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text('Leaders',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}