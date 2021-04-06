import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'UserAPI.dart';
import 'LoginPage.dart';
import 'model/User.dart';


class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();      //cria uma chave global que identifica unicamente o Form
  Future<User> _futureUser;
  Map<String, String> _userInformation = {};
  bool _isRegistrerFieldsValidated = false;
  bool _autoValidate = false;
  UserAPI api = UserAPI();

  String _validateName(String name) {
    Pattern textPattern = r"^[A-zÀ-ú ,.'-]*$";
    RegExp regex = new RegExp(textPattern);
    String validateMessage;

    if(name.length == 0) {
      validateMessage = "Este campo precisa ser preenchido.";

    } else if(name.length < 3) {
      validateMessage = "Este campo precisa ser maior que 2 caracteres.";

    } else if(name.length > 40) {
      validateMessage = "Este campo precisa ser menor que 40 caracteres.";

    } else if(!regex.hasMatch(name)) {
      validateMessage = "Valor inválido.";

    }

    return validateMessage;
  }

  String _validateDate(String date) {
    Pattern datePattern = r"^(\d{2})/(\d{2})/(\d{4})$";
    RegExp regex = new RegExp(datePattern);
    String validateMessage;

    if(date.length == 0) {
      validateMessage = "Esse campo precisa ser preenchido.";

    } else if (!regex.hasMatch(date)) {
      validateMessage = "Valor inválido.";
    }

    return validateMessage;
  }

  String _validateEmail(String email) {
    Pattern emailPattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = new RegExp(emailPattern);
    String validateMessage;

    if(email.length == 0) {
      validateMessage = "Esse campo precisa ser preenchido.";

    } else if(!regex.hasMatch(email)) {
      validateMessage = "Valor inválido.";

    }

    return validateMessage;
  }

  String _validatePassword(String password) {
    String validateMessage;

    if(password.length == 0) {
      validateMessage = "Esse campo precisa ser preenchido.";

    } else if(password.length < 8) {
      validateMessage = "Esse campo precisa ter pelo menos 8 caracteres.";
   }

   return validateMessage;

  }

  String _validatePhoneNumber(String phoneNumber) {
    Pattern phoneNumberPattern = r'(^(\d{2}|\d{0})[-. ]?(\d{5}|\d{4})[-. ]?(\d{4})$)';
    RegExp regex = new RegExp(phoneNumberPattern);
    String validateMessage;

    if(phoneNumber.length > 0 && !regex.hasMatch(phoneNumber)){
      validateMessage = "Valor inválido.";
    }

    return validateMessage;
  }

  String _validateCep(String cep) {
    Pattern cepPattern = r'^(\d{5})[-](\d{3})$';
    RegExp regex = new RegExp(cepPattern);
    String validateMessage;

    if(cep.length > 0 && !regex.hasMatch(cep)) {
      validateMessage = "Valor inválido.";
    }

    return validateMessage;
  }

  String _validateNumberAdress(String numberAdress) {
    Pattern numberAdressPattern = r"^[0-9]*$";
    RegExp regex = new RegExp(numberAdressPattern);
    String validateMessage;

    if(!regex.hasMatch(numberAdress)) {
      validateMessage = "Valor inválido.";
    }

    return validateMessage;
  }

  String _validateAdressField(String field) {
    Pattern textPattern = r"^[A-zÀ-ú0-9 ,.'-]+$";
    RegExp regex = new RegExp(textPattern);
    String validateMessage;

    if(field.length == 0) {
      validateMessage = "Esse campo precisa ser preenchido.";

    } else if(field.length < 3) {
      validateMessage = "Esse campo precisa ser maior que 2 caracteres.";

    } else if(field.length > 40) {
      validateMessage = "Esse campo precisa ser menor que 40 caracteres.";

    } else if(!regex.hasMatch(field)) {
      validateMessage = "Valor inválido.";

    }

    return validateMessage;
  }

  String _validateAdressComplement(String complement) {
    Pattern textPattern = r"^[A-zÀ-ú0-9 ,.'-]*$";
    RegExp regex = new RegExp(textPattern);
    String validateMessage;

    if(!regex.hasMatch(complement)) {
      validateMessage = "Valor inválido.";
    }

    return validateMessage;
  }

  void _validateInputs() {
    if(_formKey.currentState.validate()) {
      _formKey.currentState.save();
      _isRegistrerFieldsValidated = true;

    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  void _showDialogConfirmation() async {
    if(_isRegistrerFieldsValidated) {
      return showDialog(
        context: context,
        builder: (param) {
          return AlertDialog(
            title: Text("Confirmação do Cadastro",
              style: TextStyle(color: Colors.black, fontSize: 15,),),
              content: SingleChildScrollView(
                child: Text("Deseja confirmar o cadastro?", style: TextStyle(color: Colors.black, fontSize: 15,)),),
              actions: <Widget>[
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(133, 102, 170, 4))),
                  onPressed: () {
                    _showSnackBarConfirmation();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                    setState(() {
                      _futureUser = api.createUser(_userInformation);
                    });
                  },
                  child: Text("Confirmar"),),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(244, 244, 244, 0)),
                      elevation: MaterialStateProperty.all(0.0)),
                  onPressed: () {
                    _isRegistrerFieldsValidated = false;
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancelar", style: TextStyle(
                    color: Color.fromRGBO(133, 102, 170, 4))),),
              ],
              backgroundColor: Color.fromRGBO(244, 244, 244, 5),
            );
          }
      );
    }
  }

  void _showSnackBarConfirmation() {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("Cadastro realizado com sucesso.")));
  }

  void _showRegisterQuitMessage() async {
    return showDialog(
        context: context,
        builder: (param) {
          return AlertDialog(
            title: Text("Cadastro", style: TextStyle(color: Colors.black, fontSize: 15,),),
            content: SingleChildScrollView(
              child: Text("Deseja sair da tela de cadastramento?", style: TextStyle(color: Colors.black, fontSize: 15,)),
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(133, 102, 170, 4))
                ),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage())
                  );
                },
                child: Text("Sim"),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(244, 244, 244, 0)),
                  elevation: MaterialStateProperty.all(0.0)
                ),
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text("Não", style: TextStyle(color: Color.fromRGBO(133, 102, 170, 4))),
              ),
            ],
            backgroundColor: Color.fromRGBO(244, 244, 244, 5),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 244, 244, 5),
      appBar: AppBar(
        title: Text("Cadastro"),
        leading: ElevatedButton(
          onPressed: _showRegisterQuitMessage,
          child: Icon(Icons.arrow_back),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color.fromRGBO(133, 102, 170, 4)),
            elevation: MaterialStateProperty.all(0.0)
          ),
        ),
        backgroundColor: Color.fromRGBO(133, 102, 170, 4),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Home',
                  style: TextStyle(color: Color.fromRGBO(133, 102, 170, 4), fontSize: 30, fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(text: 'mate', style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(142, 198, 197, 4),)),
                  ],
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: FormUI()
            ),
          ],
        ),
      )
    );
  }

  Widget FormUI() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextFormField(
            validator: _validateName,
            onSaved: (value) {
              _userInformation['name'] = value;
            },
            autofocus: true,
            keyboardType: TextInputType.text,
            style: TextStyle(color: Color.fromRGBO(105, 131, 170, 2), fontSize: 15),
            decoration: InputDecoration(labelText: "Nome*", labelStyle: TextStyle(color: Colors.black),),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextFormField(
            validator: _validateEmail,
            onSaved: (value) {
              _userInformation['email'] = value;
            },
            autofocus: true,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Color.fromRGBO(105, 131, 170, 2), fontSize: 15),
            decoration: InputDecoration(labelText: "Email*", labelStyle: TextStyle(color: Colors.black),),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextFormField(
            validator: _validatePassword,
            onSaved: (value) {
              _userInformation['password'] = value;
            },
            autofocus: true,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            style: TextStyle(color: Color.fromRGBO(105, 131, 170, 2), fontSize: 15),
            decoration: InputDecoration(labelText: "Senha*", labelStyle: TextStyle(color: Colors.black),),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: DropdownButtonFormField(
            hint: Text("", style: TextStyle(color: Color.fromRGBO(105, 131, 170, 2), fontSize: 15),),
            decoration: InputDecoration(labelText: "Gênero", labelStyle: TextStyle(color: Colors.black),),
            items: [
              DropdownMenuItem<String>(
                child: Text("Feminino"),
                value: "Feminino"
              ),
              DropdownMenuItem<String>(
                child: Text("Masculino"),
                value: "Masculino"
              )
            ],
            onChanged: (value) async {
              setState(() {
                _userInformation['gender'] = value;
              });
            },
          )
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextFormField(
            validator: _validateDate,
            onSaved: (value) {
              _userInformation['birthDate'] = value;
            },
            autofocus: true,
            keyboardType: TextInputType.text,
            style: TextStyle(color: Color.fromRGBO(105, 131, 170, 2), fontSize: 15),
            decoration: InputDecoration(labelText: "Data de nascimento*", labelStyle: TextStyle(color: Colors.black),
              hintText: 'Ex: 16/11/1992',
              hintStyle: TextStyle(fontWeight: FontWeight.w200, fontSize: 13)
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextFormField(
            validator: _validatePhoneNumber,
            onSaved: (value) {
              _userInformation['phoneNumber'] = value;
            },
            autofocus: true,
            keyboardType: TextInputType.phone,
            style: TextStyle(color: Color.fromRGBO(105, 131, 170, 2), fontSize: 15),
            decoration: InputDecoration(labelText: "Telefone", labelStyle: TextStyle(color: Colors.black),),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextFormField(
            validator: _validateCep,
            onSaved: (value) {
              _userInformation['cep'] = value;
            },
            autofocus: true,
            keyboardType: TextInputType.numberWithOptions(signed:true),
            style: TextStyle(color: Color.fromRGBO(105, 131, 170, 2), fontSize: 15),
            decoration: InputDecoration(labelText: "CEP",labelStyle: TextStyle(color: Colors.black),
              hintText: 'Ex: 58429-120',
              hintStyle: TextStyle(fontWeight: FontWeight.w200, fontSize: 13)
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextFormField(
            validator: _validateAdressField,
            onSaved: (value) {
              _userInformation['street'] = value;
            },
            autofocus: true,
            keyboardType: TextInputType.text,
            style: TextStyle(color: Color.fromRGBO(105, 131, 170, 2), fontSize: 15),
            decoration: InputDecoration(labelText: "Rua*", labelStyle: TextStyle(color: Colors.black),),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextFormField(
            validator: _validateNumberAdress,
            onSaved: (value) {
              _userInformation['number'] = value;
            },
            autofocus: true,
            keyboardType: TextInputType.number,
            style: TextStyle(color: Color.fromRGBO(105, 131, 170, 2), fontSize: 15),
            decoration: InputDecoration(labelText: "Número", labelStyle: TextStyle(color: Colors.black),),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextFormField(
            validator: _validateAdressField,
            onSaved: (value) {
              _userInformation['neighborhood'] = value;
            },
            autofocus: true,
            keyboardType: TextInputType.text,
            style: TextStyle(
                color: Color.fromRGBO(105, 131, 170, 2), fontSize: 15),
            decoration: InputDecoration(
              labelText: "Bairro*",
              labelStyle: TextStyle(color: Colors.black),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextFormField(
            autofocus: true,
            validator: _validateAdressComplement,
            onSaved: (value) {
              _userInformation['complement'] = value;
            },
            keyboardType: TextInputType.text,
            style: TextStyle(
                color: Color.fromRGBO(105, 131, 170, 2), fontSize: 15),
            decoration: InputDecoration(
              labelText: "Complemento",
              labelStyle: TextStyle(color: Colors.black),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextFormField(
            validator: _validateAdressField,
            onSaved: (value) {
              _userInformation['city'] = value;
            },
            autofocus: true,
            keyboardType: TextInputType.text,
            style: TextStyle(
                color: Color.fromRGBO(105, 131, 170, 2), fontSize: 15),
            decoration: InputDecoration(
              labelText: "Cidade*",
              labelStyle: TextStyle(color: Colors.black),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextFormField(
            validator: _validateAdressField,
            onSaved: (value) {
              _userInformation['state'] = value;
            },
            autofocus: true,
            keyboardType: TextInputType.text,
            style: TextStyle(
                color: Color.fromRGBO(105, 131, 170, 2), fontSize: 15),
            decoration: InputDecoration(
              labelText: "Estado*",
              labelStyle: TextStyle(color: Colors.black),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0, bottom: 20),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(133, 102, 170, 4)),
                  ),
                  onPressed: () {
                    _validateInputs();
                    _showDialogConfirmation();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Text("CADASTRAR", textAlign: TextAlign.center, style: TextStyle(color: Colors.white,),),
                  ),
                ),
              ),
            ],
          ),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Já tem cadastro? ',
            style: TextStyle(color: Colors.black, fontSize: 15),
            children: <TextSpan>[
              TextSpan(text: 'Entre', style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(133, 102, 170, 4),),
                recognizer: new TapGestureRecognizer()..onTap = () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}