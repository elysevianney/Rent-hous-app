/*import 'package:dio/dio.dart';


import 'custom_interceptor.dart';

class AuthRepository {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: "base url",
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
    responseType: ResponseType.json,
  ))
    ..interceptors.addAll([CustomInterceptors()]);

  Future<Session?> loginUser(
      {required String email, required String password}) async {
    try {
      final response = await _dio
          .post("Endpoints.login", data: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        //todo share preference to save user login

        return null;
       // return Session.fromJson(response.data);
      }
      return null;
    } on DioException catch (error) {
      // If the request fails, throw an exception with a message
      throw Exception('Failed to load users');
    }
  }

  Future<void> registerUser() async {
    //todo register
  }
}

class Session {
}
*/