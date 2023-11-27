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
    "last_login": "2023-09-13T03:52:58.706Z",
      "first_name": firstname,
      "last_name": lastname,
      "password": password,
      "email": email,
      "phone_number": phone,
      "is_admin" : false,
      "birthdate": "2023-09-13",
      "gender": "M",
      "deleted": false
    };
  }
}
