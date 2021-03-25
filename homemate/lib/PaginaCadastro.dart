import 'package:flutter/material.dart';

class PaginaCadastro extends StatefulWidget {
  @override
  _PaginaCadastroState createState() => _PaginaCadastroState();
}

class _PaginaCadastroState extends State<PaginaCadastro> {

  //cria uma chave global que identifica unicamente o Form
  final _chaveFormulario = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 244, 244, 5),
      appBar: AppBar(
        title: Text("Cadastro"),
        backgroundColor: Color.fromRGBO(133, 102, 170, 4),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
              // CircleAvatar(
              //   radius: 100,
              //   backgroundImage: NetworkImage(""),
              // )
              Form(
                key: _chaveFormulario,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: TextField(
                        autofocus: true,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                            color: Color.fromRGBO(105, 131, 170, 2), fontSize: 18),
                        decoration: InputDecoration(
                          labelText: "Nome*",
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: TextField(
                        autofocus: true,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                            color: Color.fromRGBO(105, 131, 170, 2), fontSize: 18),
                        decoration: InputDecoration(
                          labelText: "Email*",
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: TextField(
                        autofocus: true,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        style: TextStyle(
                            color: Color.fromRGBO(105, 131, 170, 2), fontSize: 18),
                        decoration: InputDecoration(
                          labelText: "Senha",
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: TextField(
                        autofocus: true,
                        keyboardType: TextInputType.visiblePassword,
                        style: TextStyle(
                            color: Color.fromRGBO(105, 131, 170, 2), fontSize: 18),
                        decoration: InputDecoration(
                          labelText: "CEP*",
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: TextField(
                        autofocus: true,
                        keyboardType: TextInputType.visiblePassword,
                        style: TextStyle(
                            color: Color.fromRGBO(105, 131, 170, 2), fontSize: 18),
                        decoration: InputDecoration(
                          labelText: "Rua*",
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: TextField(
                        autofocus: true,
                        keyboardType: TextInputType.visiblePassword,
                        style: TextStyle(
                            color: Color.fromRGBO(105, 131, 170, 2), fontSize: 18),
                        decoration: InputDecoration(
                          labelText: "Número",
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: TextField(
                        autofocus: true,
                        keyboardType: TextInputType.visiblePassword,
                        style: TextStyle(
                            color: Color.fromRGBO(105, 131, 170, 2), fontSize: 18),
                        decoration: InputDecoration(
                          labelText: "Bairro*",
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: TextField(
                        autofocus: true,
                        keyboardType: TextInputType.visiblePassword,
                        style: TextStyle(
                            color: Color.fromRGBO(105, 131, 170, 2), fontSize: 18),
                        decoration: InputDecoration(
                          labelText: "Complemento",
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: TextField(
                        autofocus: true,
                        keyboardType: TextInputType.visiblePassword,
                        style: TextStyle(
                            color: Color.fromRGBO(105, 131, 170, 2), fontSize: 18),
                        decoration: InputDecoration(
                          labelText: "Estado",
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: TextField(
                        autofocus: true,
                        keyboardType: TextInputType.visiblePassword,
                        style: TextStyle(
                            color: Color.fromRGBO(105, 131, 170, 2), fontSize: 18),
                        decoration: InputDecoration(
                          labelText: "Cidade",
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(133, 102, 170, 4)),
                              ),
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15.0),
                                child: Text("Cadastrar",
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
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
