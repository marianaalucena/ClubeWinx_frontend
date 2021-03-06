import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homemate/ResetSenha.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 244, 244, 5),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30.0),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
             Icon(Icons.house_outlined, size: 150, color: Color.fromRGBO(133, 102, 170, 4)),
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
               height: 10,
             ),
              Text("Bem-vindo de volta!", textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,),),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: _validarEmail,
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                    color: Color.fromRGBO(105, 131, 170, 2), fontSize: 15),
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.black),

                ),
              ),

              SizedBox(
                height: 10,
              ),
              TextField(
                autofocus: true,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                style: TextStyle(
                    color: Color.fromRGBO(105, 131, 170, 2), fontSize: 15),
                decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
              FlatButton(
                child: Text("Esqueceu a senha?", style: TextStyle(color: Color.fromRGBO(105, 131, 170, 4)), textAlign: TextAlign.start,),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResetSenha()),
                  );
                },
              ),

              SizedBox(
                height: 40,
              ),
              RaisedButton(
                onPressed: () {},
               child: Container(
                height: 20,
                child: Text("ENTRAR", textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),),
                color: Color.fromRGBO(105, 131, 170, 2),
                elevation: 3.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1.0),
                    side: BorderSide(color: Color.fromRGBO(105, 131, 170, 2),)),
              ),
              SizedBox(
                height: 20,
              ),

              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Ainda n??o tem cadastro? ',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                  children: <TextSpan>[
                    TextSpan(text: 'Cadastre-se', style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(133, 102, 170, 4),)),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  String _validarEmail(String value) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Informe o Email";
    } else if(!regExp.hasMatch(value)){
      return "Email inv??lido";
    }else {
      return null;
    }
  }
}
