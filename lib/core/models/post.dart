// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Annonce AnnonceFromJson(String str) => Annonce.fromJson(json.decode(str));

String AnnonceToJson(Annonce data) => json.encode(data.toJson());

class Annonce {
  String id;
  List<ImageA> image;
  UserA user;
  String ville;
  String quatier;
  int prix;
  int nbreDouche;
  int nbreChambre;
  int nbrePersonne;
  String description;
  DateTime date;
  bool sanitaire;
  bool electricite;
  bool eau;
  bool carrele;
  bool status;
  bool deleted;
  String updatedAt;
  String createdAt;

  Annonce({
    required this.id,
    required this.image,
    required this.user,
    required this.ville,
    required this.quatier,
    required this.prix,
    required this.nbreDouche,
    required this.nbreChambre,
    required this.nbrePersonne,
    required this.description,
    required this.date,
    required this.sanitaire,
    required this.electricite,
    required this.eau,
    required this.carrele,
    required this.status,
    required this.deleted,
    required this.updatedAt,
    required this.createdAt,
  });

  factory Annonce.fromJson(Map<String, dynamic> json) => Annonce(
    id: json["id"] as String,
    image: List<ImageA>.from(json["image"].map((x) => ImageA.fromJson(x))),
    user: UserA.fromJson(json["user"]),
    ville: json["ville"] as String,
    quatier: json["quatier"]as String,
    prix: json["prix"] as int,
    nbreDouche: json["nbre_douche"]  as int,
    nbreChambre: json["nbre_chambre"] as int,
    nbrePersonne: json["nbre_personne"] as int,
    description: json["description"]as String,
    date: DateTime.parse(json["date"]),
    sanitaire: json["sanitaire"] as bool,
    electricite: json["electricite"]as bool,
    eau: json["eau"]as bool,
    carrele: json["carrele"] as bool,
    status: json["status"]as bool,
    deleted: json["deleted"]as bool,
    updatedAt: json["updated_at"],
    createdAt: json["created_at"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": List<dynamic>.from(image.map((x) => x.toJson())),
    "user": user.toJson(),
    "ville": ville,
    "quatier": quatier,
    "prix": prix,
    "nbre_douche": nbreDouche,
    "nbre_chambre": nbreChambre,
    "nbre_personne": nbrePersonne,
    "description": description,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "sanitaire": sanitaire,
    "electricite": electricite,
    "eau": eau,
    "carrele": carrele,
    "status": status,
    "deleted": deleted,
    "updated_at": updatedAt,
    "created_at": createdAt,
  };
}

class ImageA {
  String id;
  String originalName;
  String type;
  String url;
  String updatedAt;
  String createdAt;

  ImageA({
    required this.id,
    required this.originalName,
    required this.type,
    required this.url,
    required this.updatedAt,
    required this.createdAt,
  });

  factory ImageA.fromJson(Map<String, dynamic> json) => ImageA(
    id: json["id"],
    originalName: json["original_name"],
    type: json["type"],
    url: json["url"],
    updatedAt: json["updated_at"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "original_name": originalName,
    "type": type,
    "url": url,
    "updated_at": updatedAt,
    "created_at": createdAt,
  };
}

class UserA {
  String id;
  dynamic lastLogin;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  bool isAdmin;
  DateTime birthdate;
  String gender;
  bool deleted;
  String createdAt;
  String updatedAt;

  UserA({
    required this.id,
    required this.lastLogin,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.isAdmin,
    required this.birthdate,
    required this.gender,
    required this.deleted,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserA.fromJson(Map<String, dynamic> json) => UserA(
    id: json["id"] ,
    lastLogin: json["last_login"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    phoneNumber: json["phone_number"],
    isAdmin: json["is_admin"],
    birthdate: DateTime.parse(json["birthdate"]),
    gender: json["gender"],
    deleted: json["deleted"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "last_login": lastLogin,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "phone_number": phoneNumber,
    "is_admin": isAdmin,
    "birthdate": "${birthdate.year.toString().padLeft(4, '0')}-${birthdate.month.toString().padLeft(2, '0')}-${birthdate.day.toString().padLeft(2, '0')}",
    "gender": gender,
    "deleted": deleted,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

/* import 'dart:convert';

import '../../export.dart';


String crateAnnonceModelToJson(CreateAnnonceModel data) => json.encode(data.toJson());

class CreateAnnonceModel {

  CreateAnnonceModel({
    required this.status,
    required this.annonce,
  });

  factory CreateAnnonceModel.fromJson(Map<String, dynamic> json) => CreateAnnonceModel(
    status: json['status'] as bool,
    annonce: Annonce.fromJson(json['annonce'] as Map<String, dynamic>),
  );
  final bool status;
  final Annonce annonce;

  Map<String, dynamic> toJson() => {
    'status': status,
    'user': annonce.toJson(),
  };
}

class Annonce {

  Annonce( {
    required this.id,
    required this.image,
    required this.ville,
    required this.quartier,
    required this.nbre_douche,
    required this.nbre_chambre,
    required this.nbre_personne,
    required this.date,
    required this.createdAt,
    required this.updatedAt,
    required this.sanitaire,
    required this.carrele,
    required this.electricite,
    required this.eau,
    required this.status,

  });

  factory Annonce.fromJson(Map<String, dynamic> json) => Annonce(
    id: json['id'] as String,
    image: json['image']['url'],
    ville: json['ville'] as String,
    quartier: json['quartier'] as String,
    nbre_douche: json['nbre_douche'] as int,
    nbre_chambre: json['phone_number'] as int,
    nbre_personne: json['nbre_personne'] as int,
    date: DateTime.parse(json['date'] as String),
    sanitaire: json['sanitaire']as bool,
    carrele: json['carrele']as bool,
    electricite: json['electricite'] as bool,
    eau: json['eau'] as bool,
    status: json['status'] as bool,
    createdAt: DateTime.parse(json['created_at'] as String),
    updatedAt: DateTime.parse(json['updated_at'] as String),
  );

  final String id;
  final String ville;
  final List<String> image;
  final String quartier ;
  final int nbre_douche ;
  final int nbre_chambre ;
  final int nbre_personne ;
  final int prix =0 ;
  final String description = '';
  final bool sanitaire;
  final bool carrele ;
  final bool electricite;
  final bool eau ;
  final bool status ;
  final DateTime? date;
  final DateTime createdAt;
  final DateTime updatedAt;

  Map<String, dynamic> toJson() => {
    'id': id,
    'image': image,
    "user": 1,
    "ville": ville,
    "quatier": quartier,
    "prix": prix,
    "nbre_douche": nbre_douche,
    "nbre_chambre": nbre_chambre,
    "nbre_personne": nbre_personne,
    "description": description,
    "date": createdAt.toIso8601String(),
    "sanitaire": sanitaire,
    "electricite": electricite,
    "eau": eau,
    "carrele": carrele,
    "status": status,
    "deleted": false,
    "updated_at": createdAt.toIso8601String(),
    "created_at": updatedAt.toIso8601String()
  };
}


 */