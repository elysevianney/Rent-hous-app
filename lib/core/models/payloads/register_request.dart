class RegisterRequest {
  RegisterRequest({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
  });

  final String firstname;
  final String lastname;
  final String email;
  final String password;

  Map<String, dynamic> mapToJson() {
    return {
      'last_name': lastname,
      'first_name': firstname,
      'password': password,
      'email': email,
    };
  }
}
