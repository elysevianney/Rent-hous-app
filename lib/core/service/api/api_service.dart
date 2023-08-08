import 'package:dio/dio.dart';

import '../../../utils_/interceptors/logger.dart';

class ApiService {
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: 'http://arenecelsia.hecamacb.com/celsia/visitbj/public/api',
  ))
    ..interceptors.addAll([
      Logger(),
    ]);

  Dio get dio => _dio;
}
