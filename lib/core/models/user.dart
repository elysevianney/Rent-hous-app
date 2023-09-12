import 'dart:convert';


String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {

  RegisterModel({
    required this.status,
    required this.user,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    status: json['status'] as bool,
    user: User.fromJson(json['user'] as Map<String, dynamic>),
  );
  final bool status;
  final User user;

  Map<String, dynamic> toJson() => {
    'status': status,
    'user': user.toJson(),
  };
}

class User {

  User({
    required this.id,
    required this.lastLogin,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.isAdmin,
    required this.birthdate,
    required this.gender,
    required this.role,
    required this.deleted,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'] as String,
    lastLogin: json['last_login'] != null ? DateTime.parse(json['last_login']
    as String,) : null,
    firstName: json['first_name'] as String,
    lastName: json['last_name'] as String,
    email: json['email'] as String,
    phoneNumber: json['phone_number'] as String,
    isAdmin: json['is_admin'] as bool,
    birthdate: DateTime.parse(json['birthdate'] as String),
    gender: json['gender']as String,
    role: json['role']as String,
    deleted: json['deleted'] as bool,
    createdAt: DateTime.parse(json['created_at'] as String),
    updatedAt: DateTime.parse(json['updated_at'] as String),
  );
  final String id;
  final DateTime? lastLogin;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final bool isAdmin;
  final DateTime birthdate;
  final String gender;
  final String role;
  final bool deleted;
  final DateTime createdAt;
  final DateTime updatedAt;

  Map<String, dynamic> toJson() => {
    'id': id,
    'last_login': lastLogin,
    'first_name': firstName,
    'last_name': lastName,
    'email': email,
    'phone_number': phoneNumber,
    'is_admin': isAdmin,
    'birthdate': "${birthdate.year.toString().padLeft(4, '0')}"
        "-${birthdate.month.toString().padLeft(2, '0')}"
        "-${birthdate.day.toString().padLeft(2, '0')}",
    'gender': gender,
    'role': role,
    'deleted': deleted,
    'created_at': createdAt.toIso8601String(),
    'updated_at': updatedAt.toIso8601String(),
  };
}
