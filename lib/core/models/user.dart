class User {
  User({
    required this.firstname,
    required this.lastname,
    required this.email,
    this.uuid,
  });

  final String firstname;
  final String lastname;
  final String email;
  String? uuid;

  factory User.fromJson(Map<String, dynamic> json) => User(
    firstname: json['first_name'],
    lastname: json['last_name'],
    email: json['email'],
    uuid: json['reference'],
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstname,
    "last_name": lastname,
    "email": email,
    "reference": uuid,
  };
}

