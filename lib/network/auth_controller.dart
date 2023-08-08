/*import 'package:flutter/foundation.dart';

import 'auth_repository.dart';



class AuthController extends ChangeNotifier {
  final AuthRepository authRepository; // Declare a final AuthRepository object
  AuthController(
      {required this.authRepository}); // Constructor to initialize the AuthRepository object

   Session? _session; // session login
  bool _loading = false; // Boolean flag to track if data is loading or not
  String _errorMessage = ''; // String to hold error message if any

  Session? get session => _session; // Getter method to get the session of user
  bool get loading => _loading; // Getter method to get the loading flag
  String get errorMessage => _errorMessage; // Getter method to get the error message

  Future<void> loginUser({required String email, required String password}) async {
    // Async method to fetch users from repository

    _loading = true; // Set loading flag to true
    notifyListeners();

    try {
      _session = await authRepository.loginUser(
          email: email,
          password:
              password); // Call loginUser() method from AuthRepository and assign the returned value to _users list
    } catch (e) {
      // Catch any exceptions
      _errorMessage = e.toString(); // Set the error message string to the exception string
    } finally {
      _loading = false; // Set loading flag to false
      notifyListeners(); // Notify listeners that the data has changed
    }
  }
}
*/