

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homemate/model/Announcement.dart';
import 'service/AnnouncementAPI.dart';
import 'package:image_picker/image_picker.dart';

import 'HomePage.dart';
import 'MyAnnouncementPage.dart';

class NewAnnouncementPage extends StatefulWidget {
  @override
  _NewAnnouncementPageState createState() => _NewAnnouncementPageState();
}

class _NewAnnouncementPageState extends State<NewAnnouncementPage> {
  Announcement announcement = new Announcement();
  final String url = 'https://capricho.abril.com.br/wp-content/uploads/2018/03/netflix-lancar-serie-live-action-clube-winx.jpg?quality=85&strip=info&crop=0px%2C266px%2C795px%2C541px&resize=680%2C453';
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  bool _checked = false;
  bool _energy = false;
  bool _water = false;
  bool _internet = false;
  String _image = "";
  final _descriptionController = TextEditingController();
  final _residentsController = TextEditingController();
  final _valueController = TextEditingController();
  final _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(133, 102, 170, 4),
        title: Text("Novo Anúncio"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: _clickButton,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              GestureDetector(
                child: Container(
                  width: 140.0,
                  height: 140.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image:  AssetImage("images/person.png"),
                      //  image: _image != null ?
                       // Image.file(_image) :
                        //AssetImage("images/person.png"),
                        //fit: BoxFit.cover
                    ),
                  ),
                ),
                onTap: (){
                  ImagePicker.pickImage(source: ImageSource.gallery).then((file){
                    if(file == null) return;
                    setState(() {
                      _image = file.path;
                    });
                  });
                },

                //body: new Container(
                //           color: Colors.grey[200],
                //           child: Image.file(
                //              new File('/storage/emulated/0/Download/forest.jpg')),
                //           alignment: Alignment.center,
                //         ),

              ),
             Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                  validator: _validateIsEmpty,
                  controller: _descriptionController,
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                      color: Color.fromRGBO(105, 131, 170, 2), fontSize: 15),
                  decoration: InputDecoration(
                      labelText: "Descrição *",
                      labelStyle: TextStyle(color: Colors.black),
                      hintText:
                          'Ex: Uma suíte disponível no residencial das flores.',
                      hintStyle:
                          TextStyle(fontWeight: FontWeight.w200, fontSize: 13)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                  controller: _residentsController,
                  validator: _validateIsEmpty,
                  autofocus: true,
                  keyboardType: TextInputType.numberWithOptions(signed: true),
                  style: TextStyle(
                      color: Color.fromRGBO(105, 131, 170, 2), fontSize: 15),
                  decoration: InputDecoration(
                      labelText: "Número de moradores *",
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: 'Ex: 2',
                      hintStyle:
                          TextStyle(fontWeight: FontWeight.w200, fontSize: 13)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                  controller: _valueController,
                  validator: _validateIsEmpty,
                  autofocus: true,
                  keyboardType: TextInputType.numberWithOptions(signed: true),
                  style: TextStyle(
                      color: Color.fromRGBO(105, 131, 170, 2), fontSize: 15),
                  decoration: InputDecoration(
                      labelText: "Valor *",
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: 'Ex: 300,00',
                      hintStyle:
                          TextStyle(fontWeight: FontWeight.w200, fontSize: 13)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 4),
                child: Text("Incluso no valor:", style: TextStyle(fontSize: 16), textAlign: TextAlign.start,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 20),
                child: Column(
                  children: <Widget>[
                    CheckboxListTile(
                      activeColor:  Color.fromRGBO(133, 102, 170, 4),
                      title: Text('Água', style: TextStyle(fontSize: 13),),
                      value: _water,
                      onChanged: (isChecked) {
                        setState(() {
                          _water = isChecked;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                    CheckboxListTile(
                      activeColor:  Color.fromRGBO(133, 102, 170, 4),
                      title: Text('Energia', style: TextStyle(fontSize: 13),),
                      value: _energy,
                      onChanged: (isChecked) {
                        setState(() {
                          _energy = isChecked;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                    CheckboxListTile(
                      activeColor:  Color.fromRGBO(133, 102, 170, 4),
                      title: Text('Internet', style: TextStyle(fontSize: 13),),
                      value: _internet,
                      onChanged: (isChecked) {
                          setState(() {
                            _internet = isChecked;
                          });

                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(133, 102, 170, 4)),
                        ),
                        onPressed: _clickButton,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: Text(
                            "ADICIONAR",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _validateCep(String cep) {
    Pattern cepPattern = r'^(\d{5})[-](\d{3})$';
    RegExp regex = new RegExp(cepPattern);
    String validateMessage;

    if (cep.length > 0 && !regex.hasMatch(cep)) {
      validateMessage = "Valor inválido.";
    }

    return validateMessage;
  }

  String _validate(String field) {
    Pattern textPattern = r"^[A-zÀ-ú0-9 ,.'-]+$";
    RegExp regex = new RegExp(textPattern);
    String validateMessage;

    if (field.length == 0) {
      validateMessage = "Esse campo precisa ser preenchido.";
    } else if (field.length < 3) {
      validateMessage = "Esse campo precisa ser maior que 2 caracteres.";
    } else if (field.length > 40) {
      validateMessage = "Esse campo precisa ser menor que 40 caracteres.";
    } else if (!regex.hasMatch(field)) {
      validateMessage = "Valor inválido.";
    }

    return validateMessage;
  }

  String _validateIsEmpty(String data){
    String validateMessage;

    if (data.isEmpty) {
      validateMessage = "Esse campo deve ser preenchido";
    }

    return validateMessage;
  }

  String _validateNumberAdress(String numberAdress) {
    Pattern numberAdressPattern = r"^[0-9]*$";
    RegExp regex = new RegExp(numberAdressPattern);
    String validateMessage;

    if (!regex.hasMatch(numberAdress)) {
      validateMessage = "Valor inválido.";
    }

    return validateMessage;
  }

  String _validateAdressComplement(String complement) {
    Pattern textPattern = r"^[A-zÀ-ú0-9 ,.'-]*$";
    RegExp regex = new RegExp(textPattern);
    String validateMessage;

    if (!regex.hasMatch(complement)) {
      validateMessage = "Valor inválido.";
    }

    return validateMessage;
  }

  _clickButton() {
    if(_formKey.currentState.validate()) {
      _formKey.currentState.save();

      String description = _descriptionController.text;
      String residents = _residentsController.text;
      String city = _cityController.text;
      String value = _valueController.text;

     announcement.description = description;
     announcement.residents = residents;
     announcement.value = value;
     announcement.water = _water;
     announcement.energy = _energy;
     announcement.internet = _internet;

      print("path image: $_image, descrição: $description, número de moradores: $residents, valor: $value, incluso no valor: água - $_water, energia - $_energy e internet - $_internet");


      //chamando a API
      var response = AnnouncementAPI.addAnnouncement(_image, description, residents, value, _water, _energy, _internet);

      //falta implementar o if que dependera do response acima
      Navigator.push(
        context,
       MaterialPageRoute(builder: (context) => MyAnnouncementPage(announcement: announcement)),
      );



    } else {
      _autoValidate = true;
    }

  }

_receberMidia() {
     if (_image == null) {
       return Container(
         child: Icon(Icons.add_photo_alternate, size: 50, color: Colors.black),
         width: 200,
         height: 150,
       );
     } else {
       return Column(
         children: <Widget>[
         //  Container(child: Image.file(_image), width: 200, height: 150),
          // Icon(Icons.photo_camera, size: 20, color: Colors.red),
         ],
       );
     }
   }


}
