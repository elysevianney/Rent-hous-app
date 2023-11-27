import 'dart:convert';


String tokenToJson(Token data) => json.encode(data.toJson());

class Token {
  final bool? status;
  final String? token;
  final String? firstName;
  final String? email;
  final String? id;

  Token({
    this.id,
    this.status,
    this.token,
    this.firstName,
    this.email,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
    id: json['id'] as String?,
    status: json['status'] as bool?,
    token: json['token'] as String?,
    firstName: json['first_name'] as String?,
    email: json['email'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'status': status,
    'token': token,
    'first_name': firstName,
    'email': email,
  };
}
