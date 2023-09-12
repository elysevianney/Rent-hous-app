import 'dart:convert';


String tokenToJson(Token data) => json.encode(data.toJson());

class Token {
  final bool? status;
  final String? token;
  final String? firstName;
  final String? email;

  Token({
    this.status,
    this.token,
    this.firstName,
    this.email,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
    status: json['status'] as bool?,
    token: json['token'] as String?,
    firstName: json['first_name'] as String?,
    email: json['email'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'token': token,
    'first_name': firstName,
    'email': email,
  };
}
