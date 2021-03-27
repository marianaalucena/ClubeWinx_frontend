import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homemate/NewPasswordPage.dart';

class ResetSenha extends StatefulWidget {
  @override
  _ResetSenhaState createState() => _ResetSenhaState();
}

class _ResetSenhaState extends State<ResetSenha> {
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
                height: 40,
              ),
              Text("Uma nova senha será enviada para o seu email",
                style: TextStyle(fontSize: 20),),
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
                onPressed: _validateInputs,
                child: Container(
                  height: 20,
                  child: Text("RECUPERAR A SENHA", textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),),),
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

  void _formToJson() {
    Map<String, dynamic> loginUser = Map();
    loginUser["email"] = _emailController.text;
    String json = jsonEncode(loginUser);

    print(json);
  }

  @override
  void dispose() {
    _emailController.dispose();
  }

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      _formToJson();
    } else {
      _autoValidate = true;
    }
  }
}