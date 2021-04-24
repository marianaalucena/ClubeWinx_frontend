import 'package:flutter/material.dart';
import 'UserAPI.dart';
import 'model/User.dart';

class ProfilesListPage extends StatefulWidget {
  @override
  _ProfilesListPageState createState() => _ProfilesListPageState();
}

class _ProfilesListPageState extends State<ProfilesListPage> {
  List<FakeProfile> profiles = [
    FakeProfile("Gabriel Alves, Masculino, 23 anos", "Av. Vinte e Sete de julho 1400", "<PetFriendly> <Cinéfolo> <HomeOffice>"),
    FakeProfile("Helena Dantas, Feminino, 20 anos", "Rua Rio Grande do Sul, 13", "<Lgbt> <Animes> <UFCG>"),
    FakeProfile("Mariana Lucena, Feminino, 25 anos", "Rua Siqueira Campos, 150", "<Literatura> <HomeOffice> <f1>"),
    FakeProfile("Thaynnara Gonçalves, Feminino, 19 anos", "Rua Desembargador Trindade, 33", "<League of Legends> <Arte> <Fotografia>"),
    FakeProfile("Thais Toscano, Feminino, 22 anos", "Rua Afonso Campos, 345", "<Músico> <UFCG> <Poesia>"),
    FakeProfile("Wesley Santos, Masculino, 26 anos", "Av. Joaquim Caroca 131", "<UEPB> <EleNao> <Kpop>"),
    FakeProfile("Victor Fernandes, Masculino, 23 anos", "Av. Vinte e Sete de julho 1400", "<PetFriendly> <Cinéfolo> <HomeOffice>"),
    FakeProfile("Juan Victor, Masculino, 20 anos", "Rua Rio Grande do Sul, 13", "<Lgbt> <Animes> <UFCG>"),
    FakeProfile("Sabrina Silva , Feminino, 25 anos", "Rua Siqueira Campos, 150", "<Literatura> <HomeOffice> <f1>"),
    FakeProfile("Maria Isabel, Feminino, 19 anos", "Rua Desembargador Trindade, 33", "<League of Legends> <Arte> <Fotografia>"),
    FakeProfile("Milena Duarte, Feminino, 22 anos", "Rua Afonso Campos, 345", "<Músico> <UFCG> <Poesia>"),
    FakeProfile("Carlos Augusto, Masculino, 26 anos", "Av. Joaquim Caroca 131", "<UEPB> <EleNao> <Kpop>"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 244, 244, 5),
      appBar: AppBar(
        title: Text("Perfis Sugeridos"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(133, 102, 170, 4)
      ),
      body: Column(
        children: profiles.map((profile) => fakeProfileTemplate(profile)).toList(),
      ),
    );
  }

  Widget fakeProfileTemplate(profile) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Wrap(
          children: <Widget>[
            Text(
              profile.firstPart,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[600],
              ),
            ),
            Text(
              profile.secondPart,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[600],
              ),
            ),
            Text(
              profile.thirdPart,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[400],
              ),
            ),
          ],
        ),
      ),
    );
  }


}

class FakeProfile {
  String firstPart;
  String secondPart;
  String thirdPart;

  FakeProfile(this.firstPart, this.secondPart, this.thirdPart);
}




