import 'package:dio/dio.dart';

import '../../../utils_/interceptors/logger.dart';

class ApiService {
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: 'http://142.93.41.242:8003/api/v1',
  ))
    ..interceptors.addAll([
      Logger(),
    ]);

  Dio get dio => _dio;
}
