import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homemate/EditProfilePage.dart';
import 'package:homemate/HomePage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Profile_helper.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  final Profile profile;

  ProfilePage({this.profile});

  @override
  _ProfilePageState createState() => _ProfilePageState();

}

class _ProfilePageState extends State<ProfilePage> {

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  final _nameFocus = FocusNode();

  bool _userEdited = false;

  Profile _editedProfile;

  @override
  void initState() {
    super.initState();

    if(widget.profile == null){
      _editedProfile = Profile();
    } else {
      _editedProfile = Profile.fromMap(widget.profile.toMap());

      _nameController.text = _editedProfile.name;
      _emailController.text = _editedProfile.email;
      _phoneController.text = _editedProfile.phone;
    }
  }
  final String url = 'https://capricho.abril.com.br/wp-content/uploads/2018/03/netflix-lancar-serie-live-action-clube-winx.jpg?quality=85&strip=info&crop=0px%2C266px%2C795px%2C541px&resize=680%2C453';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 244, 244, 5),
      appBar: AppBar(
        title: Text("Perfil"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage())
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit_outlined),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfilePage())
              );
            },
          ),
        ],
        backgroundColor: Color.fromRGBO(133, 102, 170, 4),
      ),
      body: SingleChildScrollView(
        child:
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 16),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2.5,
              decoration: BoxDecoration(
                color: Color.fromRGBO(133, 102, 170, 5),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(32),
                    bottomLeft: Radius.circular(32)
                ),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                          width: 140.0,
                          height: 140.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: _editedProfile.img != null ?
                                FileImage(File(_editedProfile.img)) :
                                AssetImage("images/person.png"),
                                fit: BoxFit.cover
                            ),
                          ),
                        ),
                        onTap: (){
                          ImagePicker.pickImage(source: ImageSource.camera).then((file){
                            if(file == null) return;
                            setState(() {
                              _editedProfile.img = file.path;
                            });
                          });
                        },
                      ),
                  ]),


                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 32),
                    child: Text('Clube Winx',
                      style: TextStyle(
                          color: Color.fromRGBO(244, 244, 244, 5),
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.email_outlined, color: Color.fromRGBO(244, 244, 244, 5),),
                              onPressed: (){},
                            ),
                            Text('Email',
                              style: TextStyle(
                                color: Color.fromRGBO(244, 244, 244, 5),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.group, color: Color.fromRGBO(244, 244, 244, 5),),
                              onPressed: (){},
                            ),
                            Text('Rede Social',
                              style: TextStyle(
                                color: Color.fromRGBO(244, 244, 244, 5),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.phone, color: Color.fromRGBO(244, 244, 244, 5)),
                              onPressed: (){},
                            ),
                            Text('Celular',
                              style: TextStyle(
                                color: Color.fromRGBO(244, 244, 244, 5),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height/2,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(42),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(244, 244, 244, 5) ,
                ),
                child: Column(
                  children: <Widget>[
                    Text('	Lorem ipsum interdum cursus convallis '
                        'fringilla dictumst vitae nec venenatis, '
                        'dictumst platea diam placerat posuere integer '
                        'ullamcorper torquent, dictumst mauris molestie '
                        'pulvinar a varius duis potenti. eu aliquam ante '
                        'metus lacus habitant bibendum urna, ligula '
                        'himenaeos scelerisque at ad aptent. ',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal, color: Color.fromRGBO(105, 131, 170, 2))
                    ),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}