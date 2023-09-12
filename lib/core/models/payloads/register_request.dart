class RegisterRequest {
  RegisterRequest( {
    required this.firstname,
    required this.lastname,
    required this.phone,
    required this.email,
    required this.password,
  });

  final String firstname;
  final String lastname;
  final String phone;
  final String email;
  final String password;

  Map<String, dynamic> mapToJson() {
    return {
      "last_login": "",
      "first_name": firstname,
      "last_name": lastname,
      "password": password,
      "email": email,
      "phone_number": phone,
      "is_admin" : false,
      "birthdate": "",
      "gender": "M",
      "deleted": false
    };
  }
}
