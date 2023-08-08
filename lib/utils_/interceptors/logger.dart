import 'dart:developer';

import 'package:dio/dio.dart';

class Logger extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('--------------------------------------------------');
    log('[DIO REQUEST]: ${options.method} ${options.path}');
    log('--------------------------------------------------');

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('--------------------------------------------------');
    log('[DIO RESPONSE] ${response.statusCode} => PATH: ${response.requestOptions.path}');
    log('--------------------------------------------------');

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('--------------------------------------------------');
    log('[DIO ERROR] ${err.response?.statusCode.toString()} => PATH: ${err.requestOptions.path}');
    log(err.response?.data['message'] ?? 'An unhandled error occured.');
    log('--------------------------------------------------');

    super.onError(err, handler);
  }
}
