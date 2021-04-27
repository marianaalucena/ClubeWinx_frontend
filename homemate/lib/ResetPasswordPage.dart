import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homemate/NewPasswordPage.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;


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
                  style: TextStyle(color: Color.fromRGBO(133, 102, 170, 4),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(text: 'mate',
                        style: TextStyle(fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(142, 198, 197, 4),)),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text("Um código será enviado para o seu email",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: _emailController,
                  validator: _validateEmail,
                  autofocus: true,
                  keyboardType: TextInputType.visiblePassword,
                  style: TextStyle(
                      color: Color.fromRGBO(105, 131, 170, 2), fontSize: 15),
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              RaisedButton(
                onPressed: _clickButton,
                child: Container(
                  height: 20,
                  child: Text("RECUPERAR A SENHA", textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),),),
                color: Color.fromRGBO(133, 102, 170, 4),
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

  String _validateEmail(String value) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Informe um email válido";
    } else if (!regExp.hasMatch(value)) {
      return "Email inválido";
    } else {
      return null;
    }
  }



  @override
  void dispose() {
    _emailController.dispose();
  }

  void _clickButton() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      String email = _emailController.text;
      print("email: $email");


      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NewPasswordPage()),
      );
    } else {
      _autoValidate = true;
    }
  }
}