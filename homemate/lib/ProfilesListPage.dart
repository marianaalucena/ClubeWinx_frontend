import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'service/UserAPI.dart';
import 'model/User.dart';

class ProfilesListPage extends StatefulWidget {
  @override
  _ProfilesListPageState createState() => _ProfilesListPageState();
}

class _ProfilesListPageState extends State<ProfilesListPage> {
  List<FakeProfile> profiles = [
    FakeProfile("Gabriel Alves, Masculino, 23 anos", "Av. Vinte e Sete de julho 1400", "<PetFriendly> <Cinema> <HomeOffice>", "images/Gabriel Alves.jpeg"),
    FakeProfile("Helena Dantas, Feminino, 20 anos", "Rua Rio Grande do Sul, 13", "<Lgbt> <Animes> <UFCG>", "images/Helena Dantas.jpeg"),
    FakeProfile("Mariana Lucena, Feminino, 25 anos", "Rua Siqueira Campos, 150", "<Literatura> <HomeOffice> <f1>", "images/Mariana Lucena.jpeg"),
    FakeProfile("Thais Toscano, Feminino, 22 anos", "Rua Afonso Campos, 345", "<Músico> <UFCG> <Poesia>", "images/Thais Toscano.jpeg"),
    FakeProfile("Thaynnara Gonçalves, Feminino, 19 anos", "Rua Desembargador Trindade, 33", "<League of Legends> <Arte> <Fotografia>", "images/Thaynnara Goncalves.jpeg"),
    FakeProfile("Wesley Santos, Masculino, 26 anos", "Av. Joaquim Caroca 131", "<UEPB> <EleNao> <Kpop>", "images/Wesley Santos.jpeg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 244, 244, 5),
      appBar: AppBar(
        title: Text("Perfis Sugeridos"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(133, 102, 170, 4),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage())
            );
          },
        ),
      ),

      body: ListView(
        children: profiles.map((profile) => fakeProfileTemplate(profile)).toList(),
      ),
    );
  }

  Widget fakeProfileTemplate(profile) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 12,
          shadowColor: Color.fromRGBO(133, 102, 170, 4),
          shape: 
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: InkWell(
            onTap: (){},
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Ink.image(
                      height: 200,
                      // image: AssetImage('images/${imagePath}.jpeg'),
                      image: AssetImage(profile.imagePath),
                      fit: BoxFit.fitWidth,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(profile.firstPart,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(profile.secondPart),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(profile.thirdPart,
                        style: TextStyle(
                          fontWeight: FontWeight.w200
                        ),
                      ),
                    )
                  ],
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text('Ver Perfil', style: TextStyle(color: Color.fromRGBO(133, 102, 170, 4))),
                    Text('Solicitar Conexão', style: TextStyle(color: Color.fromRGBO(133, 102, 170, 4)))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


}

class FakeProfile {
  String firstPart;
  String secondPart;
  String thirdPart;
  String imagePath;

  FakeProfile(this.firstPart, this.secondPart, this.thirdPart, this.imagePath);
}




