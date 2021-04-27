class Announcement {
  String image;
  String description;
  String residents;
  String cep;
  String street;
  String district;
  String city;
  String state;
  String value;
  bool water;
  bool energy;
  bool internet;

  Announcement(
      {this.image,
        this.description,
        this.residents,
        this.cep,
        this.street,
        this.district,
        this.city,
        this.state,
        this.value,
        this.water,
        this.energy,
        this.internet});

  Announcement.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    description = json['description'];
    residents = json['residents'];
    cep = json['cep'];
    street = json['street'];
    district = json['district'];
    city = json['city'];
    state = json['state'];
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
    data['cep'] = this.cep;
    data['street'] = this.street;
    data['district'] = this.district;
    data['city'] = this.city;
    data['state'] = this.state;
    data['value'] = this.value;
    data['water'] = this.water;
    data['energy'] = this.energy;
    data['internet'] = this.internet;
    return data;
  }

  String toString(){
    return 'Announcement("image: $image, description: $description, residents: $residents, cep: $cep, street: $street,'
        'district: $district, city: $city, state: $state, value: $value, water: $water, energy: $energy, internet: $internet")';
  }
}