import 'dart:convert';

Message MessageFromJson(String str) => Message.fromJson(json.decode(str));

String MessageToJson(Message data) => json.encode(data.toJson());

class Message {
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

  Message({
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

  factory Message.fromJson(Map<String, dynamic> json) => Message(
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