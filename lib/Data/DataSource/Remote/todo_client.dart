import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'Helper/rest_api_interceptor.dart';

class TodoClient extends GetxService {
  Future<Dio> init() async {
    final client = Dio()
      ..options.baseUrl = "https://todo.com"
      ..options.receiveTimeout = 500
      ..options.sendTimeout = 500
      ..options.connectTimeout = 500
      ..options.headers["Accept"] = "application/json"
      ..options.contentType = 'application/json; charset=utf-8'
      ..interceptors.add(RestApiInterceptor(withAuth: true));
    return client;
  }
}
