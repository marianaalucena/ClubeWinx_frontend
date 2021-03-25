import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NovaSenha extends StatefulWidget {
  @override
  _NovaSenhaState createState() => _NovaSenhaState();
}

class _NovaSenhaState extends State<NovaSenha> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 244, 244, 5),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(133, 102, 170, 4),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Home',
                  style: TextStyle(color: Color.fromRGBO(133, 102, 170, 4), fontSize: 30, fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(text: 'mate', style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(142, 198, 197, 4),)),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                autofocus: true,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                style: TextStyle(
                    color: Color.fromRGBO(105, 131, 170, 2), fontSize: 15),
                decoration: InputDecoration(
                  labelText: "Nova senha",
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NovaSenha()),
                  );
                },
                child: Container(
                  height: 20,
                  child: Text("ENVIAR", textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),),
                color: Color.fromRGBO(105, 131, 170, 2),
                elevation: 3.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1.0),
                    side: BorderSide(color: Color.fromRGBO(105, 131, 170, 2),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
