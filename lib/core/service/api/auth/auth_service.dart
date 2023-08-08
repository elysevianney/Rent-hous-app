import 'package:dio/dio.dart';

import '../../../models/payloads/register_request.dart';
import '../../../models/user.dart';
import '../api_endpoints.dart';
import '../api_service.dart';

class AuthService extends ApiService {
  Future<bool> register(RegisterRequest payload) async {
    try {
      Response<dynamic> response = await dio.post(
        ApiEndpoint.register,
        data: payload.mapToJson(),
      );

      if (response.statusCode == 201) {
        return true;
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    }

    return false;
  }

  Future<dynamic> login(String email, String password) async {
    User? user;

    try {
      Response<dynamic> response = await dio.post(
        ApiEndpoint.login,
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        user = User.fromJson(response.data['data']);
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    }

    return user;
  }
}
