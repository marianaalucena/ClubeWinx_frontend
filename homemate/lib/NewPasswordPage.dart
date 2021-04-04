import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homemate/LoginPage.dart';

class NewPasswordPage extends StatefulWidget {
  @override
  _NewPasswordPageState createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {

  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  final _passwordController = TextEditingController();

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
                height: 50,
              ),
              Text("Informe o código enviado para o seu email.", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
              SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: TextFormField(
                  maxLength: 4,
                  controller: _passwordController,
                  validator: _validatePassword,
                  autofocus: true,
                  keyboardType: TextInputType.visiblePassword,
                  style: TextStyle(
                      color: Color.fromRGBO(105, 131, 170, 2), fontSize: 15),
                  decoration: InputDecoration(
                    labelText: "Código",
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              RaisedButton(
                onPressed: _clickButton,
                child: Container(
                  height: 20,
                  child: Text("ENVIAR", textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),),
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

  String _validatePassword(String value){
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if(value.isEmpty){
      return "Informe um código";
    } else if(value.length != 4){
      return "O código deve ter 4 dígitos";
    }else if (!regExp.hasMatch(value)) {
      return "O código só deve conter dígitos";
    }
    return null;
  }

  void _clickButton() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } else {
      _autoValidate = true;
    }
  }
}