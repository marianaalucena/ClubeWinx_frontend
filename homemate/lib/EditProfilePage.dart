import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:homemate/ProfilePage.dart';
import 'package:homemate/EditUserAPI.dart';
import 'package:homemate/model/User.dart';


class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  final _formKey = GlobalKey<FormState>();      //cria uma chave global que identifica unicamente o Form
  bool _autoValidate = false;
  var _selectedGender;
  EditUserAPI api = EditUserAPI();
  Future<User> _futureUser;
  Map<String, String> _userInformation = {};
  final String url = 'https://capricho.abril.com.br/wp-content/uploads/2018/03/netflix-lancar-serie-live-action-clube-winx.jpg?quality=85&strip=info&crop=0px%2C266px%2C795px%2C541px&resize=680%2C453';

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
    Pattern textPattern = r"^[a-zA-Z ,.'-]+$";
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
    Pattern textPattern = r"^[a-zA-Z0-9 ,.'-]+$";
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
    Pattern textPattern = r"^[a-zA-Z0-9 ,.'-]*$";
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
          title: Text("Editar Perfil"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage())
              );
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.check),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                setState(() {
                  _futureUser = api.editUser(_userInformation);
                });
              },
            ),
          ],
          backgroundColor: Color.fromRGBO(133, 102, 170, 4),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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

      ],
    );
  }
}
