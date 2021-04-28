class Announcement {
  String image;
  String description;
  String residents;
  String value;
  bool water;
  bool energy;
  bool internet;

  Announcement(
      {this.image,
        this.description,
        this.residents,
        this.value,
        this.water,
        this.energy,
        this.internet});

  Announcement.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    description = json['description'];
    residents = json['residents'];
    value = json['value'];
    water = json['water'];
    energy = json['energy'];
    internet = json['internet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['description'] = this.description;
    data['residents'] = this.residents;
    data['value'] = this.value;
    data['water'] = this.water;
    data['energy'] = this.energy;
    data['internet'] = this.internet;
    return data;
  }

  String toString(){
    return 'Announcement("image: $image, description: $description, residents: $residents,'
         'value: $value, water: $water, energy: $energy, internet: $internet")';
  }
}