


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(105, 131, 170, 2),//(142, 198, 197, 0.4),
        title: Text("HOMEMATE"),
        centerTitle: true,
      ),

      backgroundColor: Color.fromRGBO(244, 244, 244, 0.9),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
        //  mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.person_outline,
            ),

            TextField(
             // controller: _nameController,
              // focusNode: _nameFocus,
              decoration: InputDecoration(labelText: "Nome"),
              onChanged: (text){},
            ),
            TextField(
             // controller: _emailController,
              decoration: InputDecoration(labelText: "Senha"),
              onChanged: (text){},
              keyboardType: TextInputType.visiblePassword,
            ),
          ],
        ),

      ),
    );

  }
}
