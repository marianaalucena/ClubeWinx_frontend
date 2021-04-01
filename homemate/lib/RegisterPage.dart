import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'LoginPage.dart';


class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _formKey = GlobalKey<FormState>();      //cria uma chave global que identifica unicamente o Form
  bool _autoValidate = false;
  var _selectedGender;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _cepController = TextEditingController();
  TextEditingController _streetAdresstController = TextEditingController();
  TextEditingController _numberAdressController = TextEditingController();
  TextEditingController _neighborhoodAdressController = TextEditingController();
  TextEditingController _complementAdressController = TextEditingController();
  TextEditingController _stateAdressController = TextEditingController();
  TextEditingController _cityAdressController = TextEditingController();

  String _validateName(String name) {
    Pattern textPattern = r"^[A-zÀ-ú ,.'-]+$";
    RegExp regex = new RegExp(textPattern);
    String validateMessage;

    if(name.length == 0) {
      validateMessage = "Este campo precisa ser preenchido.";

    } else if(name.length < 3) {
      validateMessage = "Este campo precisa ser maior que 2 caracteres.";

    } else if(name.length > 30) {
      validateMessage = "Este campo precisa ser menor que 30 caracteres.";

    } else if(!regex.hasMatch(name)) {
      validateMessage = "Valor inválido.";

    }

    return validateMessage;
  }

  String _validateDate(String date) {
    Pattern datePattern = r"^(0?[1-9]|[12][0-9]|3[01])[/-](0?[1-9]|1[012])[/-]\d{4}$";
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

    } else if(email.length < 3) {
      validateMessage = "Esse campo precisa ser maior que 2 caracteres.";

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
    String validateMessage = null;

    if(!regex.hasMatch(phoneNumber) && phoneNumber.length > 0){
      validateMessage = "Valor inválido.";
    }

    return validateMessage;
  }

  String _validateCep(String cep) {
    Pattern cepPattern = r'(^(\d{5})[-](\d{3})$)?';
    RegExp regex = new RegExp(cepPattern);
    String validateMessage;

    if(!regex.hasMatch(cep)) {
      validateMessage = "Valor inválido.";
    }

    return validateMessage;
  }

  String _validateNumberAdress(String numberAdress) {
    Pattern numberAdressPattern = r'(^[0-9]*$)';
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

    } else if(field.length > 30) {
      validateMessage = "Esse campo precisa ser menor que 30 caracteres.";

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
      _autoValidate = false;
      _formKey.currentState.save();

    } else {
      _autoValidate = true;
    }
  }

  void _showRegisterConfirmation() async {
    if (_autoValidate == false) {
      return showDialog(
          context: context,
          builder: (param) {
            return AlertDialog(
              title: Text("Confirmação do Cadastro", style: TextStyle(color: Colors.black, fontSize: 15,),),
              content: SingleChildScrollView(
                child: Text("Deseja confirmar o cadastro?", style: TextStyle(color: Colors.black, fontSize: 15,)),
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
                  child: Text("Confirmar"),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(244, 244, 244, 0)),
                      elevation: MaterialStateProperty.all(0.0)
                  ),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancelar", style: TextStyle(color: Color.fromRGBO(133, 102, 170, 4))),
                ),
              ],
              backgroundColor: Color.fromRGBO(244, 244, 244, 5),
            );
          }
      );
    }
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
  void dispose() {
    //Clean up the controller when the widget is removed from the tree
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneNumberController.dispose();
    _cepController.dispose();
    _streetAdresstController.dispose();
    _numberAdressController.dispose();
    _neighborhoodAdressController.dispose();
    _complementAdressController.dispose();
    _stateAdressController.dispose();
    _cityAdressController.dispose();
    super.dispose();
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
              // CircleAvatar(
              //   radius: 100,
              //   backgroundImage: NetworkImage(""),
              // )
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
            controller: _nameController,
            validator: _validateName,
            autofocus: true,
            keyboardType: TextInputType.text,
            style: TextStyle(color: Color.fromRGBO(105, 131, 170, 2), fontSize: 15),
            decoration: InputDecoration(labelText: "Nome*", labelStyle: TextStyle(color: Colors.black),),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextFormField(
            controller: _emailController,
            validator: _validateEmail,
            autofocus: true,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Color.fromRGBO(105, 131, 170, 2), fontSize: 15),
            decoration: InputDecoration(labelText: "Email*", labelStyle: TextStyle(color: Colors.black),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextFormField(
            controller: _passwordController,
            validator: _validatePassword,
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
            value: _selectedGender,
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
               _selectedGender = value;
             });
            },
          )
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextFormField(
            controller: _dateController,
            validator: _validateDate,
            autofocus: true,
            keyboardType: TextInputType.text,
            style: TextStyle(color: Color.fromRGBO(105, 131, 170, 2), fontSize: 15),
            decoration: InputDecoration(labelText: "Data de nascimento*", labelStyle: TextStyle(color: Colors.black),),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextFormField(
            controller: _phoneNumberController,
            validator: _validatePhoneNumber,
            autofocus: true,
            keyboardType: TextInputType.phone,
            style: TextStyle(color: Color.fromRGBO(105, 131, 170, 2), fontSize: 15),
            decoration: InputDecoration(labelText: "Telefone", labelStyle: TextStyle(color: Colors.black),),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextFormField(
            controller: _cepController,
            validator: _validateCep,
            autofocus: true,
            keyboardType: TextInputType.numberWithOptions(signed:true),
            style: TextStyle(color: Color.fromRGBO(105, 131, 170, 2), fontSize: 15),
            decoration: InputDecoration(labelText: "CEP",labelStyle: TextStyle(color: Colors.black),),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextFormField(
            controller: _streetAdresstController,
            validator: _validateAdressField,
            autofocus: true,
            keyboardType: TextInputType.text,
            style: TextStyle(color: Color.fromRGBO(105, 131, 170, 2), fontSize: 15),
            decoration: InputDecoration(labelText: "Rua*", labelStyle: TextStyle(color: Colors.black),),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextFormField(
            controller: _numberAdressController,
            validator: _validateNumberAdress,
            autofocus: true,
            keyboardType: TextInputType.number,
            style: TextStyle(color: Color.fromRGBO(105, 131, 170, 2), fontSize: 15),
            decoration: InputDecoration(labelText: "Número", labelStyle: TextStyle(color: Colors.black),),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextFormField(
            controller: _neighborhoodAdressController,
            validator: _validateAdressField,
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
            controller: _complementAdressController,
            validator: _validateAdressComplement,
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
            controller: _cityAdressController,
            validator: _validateAdressField,
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
            controller: _stateAdressController,
            validator: _validateAdressField,
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
                    _showRegisterConfirmation();
                    ScaffoldMessenger.of(context)
                      ..removeCurrentSnackBar()
                      ..showSnackBar(SnackBar(content: Text("Cadastro realizado com sucesso.")));
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