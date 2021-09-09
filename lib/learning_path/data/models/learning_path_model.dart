import 'dart:convert';

class LearningPathModel {
  LearningPathModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final Address? address;
  final String? phone;
  final String? website;
  final Company? company;

  factory LearningPathModel.fromJson(String? str) => LearningPathModel.fromMap(json.decode(str!));

  String? toJson() => json.encode(toMap());

  factory LearningPathModel.fromMap(Map<String?, dynamic> json) => LearningPathModel(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    username: json["username"] == null ? null : json["username"],
    email: json["email"] == null ? null : json["email"],
    address: json["address"] == null ? null : Address.fromMap(json["address"]),
    phone: json["phone"] == null ? null : json["phone"],
    website: json["website"] == null ? null : json["website"],
    company: json["company"] == null ? null : Company.fromMap(json["company"]),
  );

  Map<String?, dynamic> toMap() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "username": username == null ? null : username,
    "email": email == null ? null : email,
    "address": address == null ? null : address!.toMap(),
    "phone": phone == null ? null : phone,
    "website": website == null ? null : website,
    "company": company == null ? null : company!.toMap(),
  };
}

class Address {
  Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  final String? street;
  final String? suite;
  final String? city;
  final String? zipcode;
  final Geo? geo;

  factory Address.fromJson(String? str) => Address.fromMap(json.decode(str!));

  String? toJson() => json.encode(toMap());

  factory Address.fromMap(Map<String?, dynamic> json) => Address(
    street: json["street"] == null ? null : json["street"],
    suite: json["suite"] == null ? null : json["suite"],
    city: json["city"] == null ? null : json["city"],
    zipcode: json["zipcode"] == null ? null : json["zipcode"],
    geo: json["geo"] == null ? null : Geo.fromMap(json["geo"]),
  );

  Map<String?, dynamic> toMap() => {
    "street": street == null ? null : street,
    "suite": suite == null ? null : suite,
    "city": city == null ? null : city,
    "zipcode": zipcode == null ? null : zipcode,
    "geo": geo == null ? null : geo!.toMap(),
  };
}

class Geo {
  Geo({
    this.lat,
    this.lng,
  });

  final String? lat;
  final String? lng;

  factory Geo.fromJson(String? str) => Geo.fromMap(json.decode(str!));

  String toJson() => json.encode(toMap());

  factory Geo.fromMap(Map<String?, dynamic> json) => Geo(
    lat: json["lat"] == null ? null : json["lat"],
    lng: json["lng"] == null ? null : json["lng"],
  );

  Map<String?, dynamic> toMap() => {
    "lat": lat == null ? null : lat,
    "lng": lng == null ? null : lng,
  };
}

class Company {
  Company({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  final String? name;
  final String? catchPhrase;
  final String? bs;

  factory Company.fromJson(String? str) => Company.fromMap(json.decode(str!));

  String? toJson() => json.encode(toMap());

  factory Company.fromMap(Map<String?, dynamic> json) => Company(
    name: json["name"] == null ? null : json["name"],
    catchPhrase: json["catchPhrase"] == null ? null : json["catchPhrase"],
    bs: json["bs"] == null ? null : json["bs"],
  );

  Map<String?, dynamic> toMap() => {
    "name": name == null ? null : name,
    "catchPhrase": catchPhrase == null ? null : catchPhrase,
    "bs": bs == null ? null : bs,
  };
}
